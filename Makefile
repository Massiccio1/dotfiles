COMMAND=sudo apt install
SUDO=$$(which sudo 2>/dev/null)

.PHONY: config isntall update sunc help test sudo font sudoers


all:apt install sync
extra: font sudoers


sync:
	./scripts/update-config.sh

install:
	./scripts/install-tools.sh

.ONESHELL:
apt:
	@$(SUDO) apt install -y git curl trash-cli zsh unzip 
	@$(SUDO) apt install -y autojump lsd bat

font:
	./scripts/install-font.sh

sudoers:
	./scripts/install-sudoers.sh
	
help:
	@echo \"make apt\" to install most of the commands used fot aliases
	@echo \"make install\" install starship zsh and extesions
	@echo \"make sync\" to sync dotfiles with th repository
	@echo \"make font\" to isntall jetbrains nerd font
	@echo \"make sudoers\" to remove sudo password requirements
	@echo 

test:
	./scripts/test.sh