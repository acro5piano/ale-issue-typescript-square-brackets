FROM tweekmonster/vim-testbed:latest


ENV VIM_TAG=neovim:v0.3.5
ENV PACKAGES="\
    bash \
    git \
    python \
    py-pip \
    nodejs \
    npm \
"

RUN apk --update add $PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* && \
    npm -g install neovim && \
    install_vim -tag $VIM_TAG -build

ADD .vimrc $HOME/.vimrc

RUN ln -svf /vim-build/bin/neovim-v0.3.5 /usr/bin/nvim
