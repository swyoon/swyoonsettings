FROM nvidia/cuda:9.1-cudnn7-runtime-ubuntu16.04

# add custom user
ENV ME=swyoon  

# basic package setting
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tmux zsh vim-nox build-essential cmake htop iftop iotop \
    wget bzip2 locales fonts-liberation git sudo
RUN apt-get install -y cuda-compiler-9.1
RUN useradd -m $ME -u 1001 && echo "$ME:$ME" | chpasswd && adduser $ME sudo
ENV CONDA_DIR=/opt/conda
ENV MINICONDA_VERSION 4.5.4
ENV PATH=$CONDA_DIR/bin:$PATH
RUN cd /tmp && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "a946ea1d0c4a642ddf0c3a26a18bb16d *Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    $CONDA_DIR/bin/conda config --system --set auto_update_conda false && \
    $CONDA_DIR/bin/conda config --system --set show_channel_urls true && \
    $CONDA_DIR/bin/conda install --quiet --yes conda="${MINICONDA_VERSION%.*}.*" && \
    $CONDA_DIR/bin/conda update --all --quiet --yes && \
    conda clean -tipsy && \
    rm -rf /root/.cache/yarn 
RUN chown $ME:users $CONDA_DIR
RUN conda install numpy scipy cupy tqdm pandas jupyter jupyterlab matplotlib pytest

# shell environment setting
RUN chsh -s /bin/zsh
USER $ME
RUN mkdir /home/$ME/.vim && git clone https://github.com/VundleVim/Vundle.vim.git /home/$ME/.vim/bundle/Vundle.vim
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ADD tmux.conf /home/$ME/.tmux.conf
ADD vimrc /home/$ME/.vimrc
ADD run_jupyter.sh /home/$ME/run_jupyter.sh
CMD ["/bin/zsh"]

