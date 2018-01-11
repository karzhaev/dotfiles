#/bin/sh

SOFTWARE_MAIN= screen vim i3 perl chromium-browser graphviz
SOFTWARE_TEX= inkscape texlive texlive-lang-cyrillic texlive-base texlive-binaries
FILE_CONFIG=vimrc netrc hosts screenrc bashrc i3config
FILE_CONFIG=~/.vimrc ~/.netrc /etc/hosts ~/.screenrc ~/.bashrc ~/.config/i3/config 
		
install_soft: 
	@sudo apt-get update
	@sudo apt-get install $(SOFTWARE_MAIN)
	@perl -MCPAN -e 'install Crypt::PasswdMD5'

install_tex: 
	@sudo apt-get install $(SOFTWARE_TEX)

install_config: nautilius 
	@cp vimrc ~/.vimrc
#	@sudo cp netrc ~/.netrc
#	@chmod a-wx ~/.netrc
	@cp screenrc ~/.screenrc
	@cp bashrc ~/.bashrc
	@mkdir -p ~/.config/i3
	@cp i3config ~/.config/i3/config
#	@sudo cp hosts /etc/hosts

gen_key:
	@ssh-keygen -t rsa -C "karzhaev@uav-siberia.com" -b 4096
	
nautilius:
	@gsettings set org.gnome.desktop.background show-desktop-icons false

all: install_soft install_config

sync:
	@cp ~/.vimrc vimrc
	@cp ~/.netrc netrc
	@cp ~/.screenrc screenrc
	@cp ~/.bashrc bashrc
	@cp ~/.config/i3/config i3config
	@cp ~/.gitconfig gitconfig
	@cp /etc/hosts hosts

git:
	@cp gitconfig ~/.gitconfig
