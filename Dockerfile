FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs zsh git-core && \
    apt-get purge -y --auto-remove

ENV ZSH_THEME robbyrusselldo
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh

WORKDIR /root/bus-train-status
COPY package.json package-lock.json ./
RUN npm install
