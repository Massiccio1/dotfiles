FROM ubuntu:24.04 as setup


RUN apt update -y
RUN apt install -y nala 
RUN nala update

RUN nala install -y curl wget sudo tzdata

#time stuff
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


FROM setup as profile

#admin user test test
RUN useradd -m  test     
RUN passwd -d test 
RUN usermod -a -G sudo  test
##sudo commands without password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

FROM profile as install

SHELL ["/bin/bash", "-c"]

# ##starship shit
# WORKDIR /root
# RUN curl -O https://starship.rs/install.sh
# RUN chmod +x install.sh
# RUN ./install.sh --yes
# RUN echo eval '"$(starship init bash)"' >> ~/.bashrc
# RUN mkdir -p ~/.config && touch ~/.config/starship.toml
# RUN wget https://gist.githubusercontent.com/Massiccio1/90dd875ba0188b670ffcba4b887d330e/raw/024f399ac34e2b21021684f966896a02fdc70e58/starship.toml -O ~/.config/starship.toml

# USER test
# RUN echo eval '"$(starship init bash)"' >> ~/.bashrc
# RUN mkdir -p ~/.config && touch ~/.config/starship.toml
# RUN wget https://gist.githubusercontent.com/Massiccio1/90dd875ba0188b670ffcba4b887d330e/raw/024f399ac34e2b21021684f966896a02fdc70e58/starship.toml -O ~/.config/starship.toml
# RUN chsh --shell /bin/bash


# FROM starship as install

USER root
RUN nala update

RUN nala install -y git curl trash-cli autojump lsd bat zsh make

RUN nala install -y neofetch git nodejs \
    python-is-python3 python3-pip \
    nano vim

RUN nala install -y net-tools iputils-ping htop traceroute
RUN nala install -y npm
RUN npm install -g nodemon
RUN nala install -y dnsutils

FROM install as folders

USER test
WORKDIR  /home/test

ENV PATH=$PATH:/home/test/.local/bin
RUN echo "export USER=$(whoami)">>.bashrc
RUN ls
RUN mkdir -p /home/test/git
WORKDIR  /home/test/git
ENV a=11
RUN git clone https://github.com/Massiccio1/dotfiles.git
WORKDIR  /home/test/git/dotfiles
# RUN make auto

# COPY . . 

ENTRYPOINT [ "/bin/bash" ]



## docker build -t linux .
# drrmi -v .:/shared linux
# docker run --rm -it 
