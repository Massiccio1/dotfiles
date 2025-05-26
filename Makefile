COMMAND=sudo apt install
SUDO=$$(which sudo 2>/dev/null)

.PHONY: config install update sunc help test sudo font sudoers kde


base:apt install sync
extra: font sudoers kde
all: base extra


sync:
	./scripts/update-config.sh

install:
	./scripts/install-tools.sh

auto:
	./scripts/install-auto.sh

.ONESHELL:
apt:
	@$(SUDO) apt install -y git curl trash-cli zsh unzip nala
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
	@echo \"make kde\" copy kde configs and setup systemd Download/delete 
	@echo 

test:
	./scripts/test.sh

kde:
	./scripts/kde.sh