COMMAND=sudo apt install
SUDO=$$(which sudo 2>/dev/null)

all:install apt sync


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

DOT := $(shell command -v ls 2> /dev/null)

test:
	ifndef DOT
		$(error "ls is not available please install graphviz")
	endif
		ls