COMMAND=sudo apt install
SUDO=$$(which sudo 2>/dev/null)

all:apt install sync font


.PHONY: config isntall update sunc help test sudo font sudoers
sync:
	./update-config.sh

install:
	./install-tools.sh

.ONESHELL:
apt:
	@$(SUDO) apt install -y git curl trash-cli zsh unzip 
	@$(SUDO) apt install -y autojump lsd bat

font:
	./install-font.sh

sudoers:
	./install-sudoers.sh
	
help:
	@echo \"make apt\" to install most of the commands used fot aliases
	@echo \"make install\" install starship zsh and extesions
	@echo \"make sync\" to sync dotfiles with th repository
	@echo \"make font\" to isntall jetbrains nerd font
	@echo \"make sudoers\" to remove sudo password requirements
	@echo 

test:
	./test.sh