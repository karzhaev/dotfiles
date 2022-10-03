#!/usr/bin/env python
import os
import pyftpdlib
import sys

from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

authorizer = DummyAuthorizer()

def add_platftform_as_user ( root_dir, platfrom_name ):
	path = root_dir + platfrom_name

	authorizer.add_user ( platfrom_name, platfrom_name, path, perm='elr' )

class MyHandler(FTPHandler):

	def on_login(self, username):
		#fix for python2
		os.popen("date \"+%F %T %z\" > " + self.root_dir + username + "/update_time")
		#f = open(self.root_dir + username + "/update_time", "w" )
		#f.write( datetime.strftime(datetime.now(timezone.utc).astimezone(), "%F %T %z" ) + "\n")
		#f.close()

def ftpd ( root_dir_ ):
	print ( 'Staring ftp at ' + root_dir_ )
	# Instantiate a dummy authorizer for managing 'virtual' users
	for platform in os.listdir(root_dir_):
		add_platftform_as_user ( root_dir_, platform )

	authorizer.add_user ( "guest", "guest", "/mnt/media", perm="elr")

	# Instantiate FTP handler class
	handler = MyHandler
	handler.root_dir = root_dir_
	handler.authorizer = authorizer

	# Define a customized banner (string returned when client connects)
	handler.banner = "pyftpdlib based ftpd ready."

	# Specify a masquerade address and the range of ports to use for
	# passive connections.  Decomment in case you're behind a NAT.
	#handler.masquerade_address = '151.25.42.11'


	#if sys.platform != "win32" and os.getuid() > 0:
	#	data_port = int(os.environ.get("FTPD_DATA_PORT", 1220))
	#	handler.passive_ports = [data_port]
	#	cmd_port = int(os.environ.get("FTPD_PORT", 1221))
	#else:
	#	cmd_port = int(os.environ.get("FTPD_PORT", 21))
	cmd_port = 21

	# Instantiate FTP server class and listen on 0.0.0.0:2121
	address = ('', cmd_port)
	server = FTPServer(address, handler)

	# set a limit for connections
	server.max_cons = 256
	server.max_cons_per_ip = 5

	# start ftp server
	server.serve_forever()

ftp_root_dir = './.release/'

if not os.path.exists( ftp_root_dir ):
	os.makedirs ( ftp_root_dir )

ftpd ( ftp_root_dir )
