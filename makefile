#/bin/sh

SOFTWARE_MAIN= screen vim vim-gtk i3 perl chromium-browser graphviz expect
SOFTWARE_TEX= inkscape texlive texlive-lang-cyrillic texlive-base texlive-binaries
FILE_CONFIG=vimrc netrc hosts screenrc bashrc i3config
FILE_CONFIG=~/.vimrc ~/.netrc /etc/hosts ~/.screenrc ~/.bashrc ~/.config/i3/config 


install_soft: 
	@sudo apt-get update
	@sudo apt-get install $(SOFTWARE_MAIN)
#
install_tex: 
	@sudo apt-get install $(SOFTWARE_TEX)

link_config:
	@ln -sr vimrc $(HOME)/.vimrc
	@ln -sr screenrc $(HOME)/.screenrc
	@ln -sr gitconfig $(HOME)/.gitconfig
#	@ln -sr Xresources $(HOME)/.Xresources

install_config: #nautilius
	@cp vimrc ~/.vimrc
#	@chmod -f 700 ~/.netrc
#	@cp netrc ~/.netrc
#	@chmod 400 ~/.netrc
	@cp screenrc ~/.screenrc
	@cp bashrc ~/.bashrc
	@mkdir -p ~/.config/i3
	@cp i3config ~/.config/i3/config
	@cp gitconfig ~/.gitconfig
##	@sudo cp hosts /etc/hosts
#
#etelnet:
#	@sudo cp scripts/etelnet /usr/bin/etelnet
#	@sudo chmod a+x /usr/bin/etelnet
#
#gen_key:
#	@ssh-keygen -t rsa -C "karzhaev@uav-siberia.com" -b 4096
#	
#nautilius:
#	@gsettings set org.gnome.desktop.background show-desktop-icons false
#
#all: install_soft install_config

sync:
	@cp ~/.vimrc vimrc
#	@cp ~/.netrc netrc
	@cp ~/.screenrc screenrc
	@cp ~/.bashrc bashrc
#	@cp ~/.config/i3/config i3config
	@cp ~/.gitconfig gitconfig

#git:
#	@cp gitconfig ~/.gitconfig
#
#video_driver_home:
#	@sudo apt-get install nvidia-384 nvidia-settings
