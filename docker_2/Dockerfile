FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# basic package setting
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tmux zsh build-essential cmake htop iftop iotop \
    wget bzip2 locales fonts-liberation git sudo software-properties-common curl
RUN add-apt-repository ppa:neovim-ppa/stable && apt update && apt install -y neovim
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8


ENV CONDA_DIR=/opt/conda
ENV MINICONDA_VERSION py38_4.12.0
ENV MINICONDA_VERSION2 4.12.0
ENV PATH=$CONDA_DIR/bin:$PATH
RUN cd /tmp && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
#      echo "78f39f9bae971ec1ae7969f0516017f2413f17796670f7040725dd83fcff5689 *Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" | sha256 -c - && \
    /bin/bash Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    $CONDA_DIR/bin/conda config --system --set auto_update_conda false && \
    $CONDA_DIR/bin/conda config --system --set show_channel_urls true && \
    $CONDA_DIR/bin/conda install --quiet --yes conda="${MINICONDA_VERSION2%.*}.*" && \
    $CONDA_DIR/bin/conda update --all --quiet --yes && \
    conda clean -tipy && \
    rm -rf /root/.cache/yarn 
RUN conda install -y -c conda-forge nodejs=17 jupyterlab numpy scipy matplotlib tqdm pytest

# shell environment setting
RUN chsh -s /bin/zsh

# install miscelleneous stuffs
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ADD tmux.conf /root/.tmux.conf
ADD vimrc /root/.vimrc
ADD init.vim /root/.config/nvim/init.vim
ADD zshrc /root/.zshrc
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install
# CMD ["/bin/zsh"]
