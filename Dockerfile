FROM theduynguyen/dl-dev-env

USER root

# Vim
RUN apt-get install -y libncurses5-dev ruby-dev lua5.1 lua5.1-dev libperl-dev python-dev && \
    apt-get remove vim vim-runtime gvim

RUN cd ~ && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-rubyinterp=yes \
                --enable-pythoninterp=yes \
                --with-python-config-dir=$CONDA_DIR/bin \
                --enable-python3interp=no \
                --enable-perlinterp=yes \
                --enable-luainterp=yes \
		--enable-clipboard=yes \
                --enable-cscope --prefix=/usr && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim80 && \
    make install

## Vim plugins
USER root
COPY vimrc /home/deeplearner/.vimrc
RUN chown deeplearner /home/deeplearner/.vimrc 

USER deeplearner

RUN chmod u+rw /home/deeplearner/.vimrc && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

# set current dir
ENV PYTHONPATH='/src/:$PYTHONPATH'
ENV PYTHONDONTWRITEBYTECODE=True
ENV TERM=xterm-256color
WORKDIR /src

#Ports
# Tensorboard
EXPOSE 6006
#Jupyter notebook
EXPOSE 8888

# Start Jupyter notebook (can be overriden)
CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0
