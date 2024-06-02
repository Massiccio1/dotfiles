all:tools-apt install config


.PHONY: sync dotfiles and .config files
config:
	./config.sh

.PHONY: install starship oh-zy-zsh and scripts
install:
	./install-tools.sh

.PHONY: install apt packages
tools-apt:
	@echo requires sudo
	apt install -y git curl trash-cli autojump lsd bat zsh fzf