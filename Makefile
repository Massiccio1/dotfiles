all:install config sync


.PHONY: config isntall update sunc help
sync:
	./update-config.sh

install:
	./install-tools.sh

apt:
	@echo requires sudo
	sudo apt install -y git curl trash-cli autojump lsd bat zsh fzf

help:
	@echo \"make apt\" to install most of the commands used fot aliases
	@echo \"make install\" install starship zsh and extesions
	@echo \"make sync\" to sync dotfiles with th repository
	@echo 