FROM debian:bookworm-slim

RUN mkdir -p /root/git/dotfiles 
WORKDIR /root/git/dotfiles 

RUN apt update
RUN apt install -y git curl trash-cli autojump lsd bat zsh make
RUN apt install -y make

RUN curl https://starship.rs/install.sh -o starship-install.sh
RUN sh starship-install.sh -y

COPY . .
# RUN make apt


# docker build -t dotfiles .
# docker run --rm -it dotfiles bash
# run make