FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

# add custom user
ENV ME=swyoon  

# basic package setting
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tmux zsh vim-nox build-essential cmake htop iftop iotop \
    wget bzip2 locales fonts-liberation git sudo
# RUN apt-get install -y cuda-compiler-9.0
RUN useradd -m $ME -u 1001 && echo "$ME:$ME" | chpasswd && adduser $ME sudo
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8


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
# RUN chown -R $ME:users $CONDA_DIR

# shell environment setting
RUN chsh -s /bin/zsh
USER $ME
RUN conda create --yes -n ml python=3.6 numpy scipy tqdm jupyter jupyterlab pytest scikit-learn nodejs
RUN /home/swyoon/.conda/envs/ml/bin/pip install cupy-cuda90 torch torchvision ipywidgets
# RUN conda run -n ml pip install numpy \
#         scipy \
#         tqdm \
#         pandas \
#         jupyter \
#         jupyterlab \
#         matplotlib \
#         pytest \
#         scikit-learn \
#         cupy-cuda90 \
#         torch \
#         torchvision
# RUN conda install numpy scipy tqdm pandas jupyter jupyterlab matplotlib pytest scikit-learn
# # RUN pip install cupy-cuda90
# ENV PATH=$CONDA_DIR/bin:$PATH
RUN mkdir /home/$ME/.vim && git clone https://github.com/VundleVim/Vundle.vim.git /home/$ME/.vim/bundle/Vundle.vim
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ADD tmux.conf /home/$ME/.tmux.conf
ADD vimrc /home/$ME/.vimrc
ADD zshrc /home/$ME/.zshrc
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/home/$ME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ADD run_jupyter.sh /home/$ME/run_jupyter.sh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/home/$ME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
CMD ["/bin/zsh"]
