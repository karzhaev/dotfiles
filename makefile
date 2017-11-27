#/bin/sh

SOFTWARE_MAIN= screen vim i3 chromium-browser graphviz inkscape
SOFTWARE_TEX= inkscape texlive texlive-lang-cyrillic texlive-base texlive-binaries
FILE_CONFIG=vimrc netrc hosts screenrc bashrc i3config
FILE_CONFIG=~/.vimrc ~/.netrc /etc/hosts ~/.screenrc ~/.bashrc ~/.config/i3/config 
		
install_soft: 
	@sudo apt-get update
	@sudo apt-get install $(SOFTWARE_MAIN)

install_tex: 
	@sudo apt-get install $(SOFTWARE_TEX)

install_config: 
	@cp vimrc ~/.vimrc
	@cp netrc ~/.netrc
	@cp screenrc ~/.screenrc
	@cp bashrc ~/.bashrc
	@mkdir ~/.config/i3
	@cp i3config ~/.config/i3/config
	@sudo cp hosts /etc/hosts

gen_key:
	@ssh-keygen
	
all: install_soft install_config gen_key

sync:
	@cp ~/.vimrc vimrc
	@cp ~/.netrc netrc
	@cp ~/.screenrc screenrc
	@cp ~/.bashrc bashrc
	@cp ~/.config/i3/config i3config
	@cp /etc/hosts hosts
