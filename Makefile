COMMAND=sudo apt install
SUDO=$$(which sudo 2>/dev/null)

all:apt install sync


.PHONY: config isntall update sunc help test test sudo
sync:
	./update-config.sh

install:
	./install-tools.sh

.ONESHELL:
apt:
	@$(SUDO) apt install -y git curl trash-cli autojump lsd bat zsh
	
help:
	@echo \"make apt\" to install most of the commands used fot aliases
	@echo \"make install\" install starship zsh and extesions
	@echo \"make sync\" to sync dotfiles with th repository
	@echo 
