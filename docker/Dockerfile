FROM jupyter/datascience-notebook
USER root
ENV HOME=/root/
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y tmux zsh vim-nox build-essential cmake htop iftop iotop
# RUN conda install jupyter jupyterlab -y
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
ADD tmux.conf /root/.tmux.conf
ADD vimrc /root/.vimrc
ADD run_jupyter.sh /root/run_jupyter.sh
RUN chsh -s /bin/zsh
CMD ["/bin/zsh"]
WORKDIR /root/
# ADD zshrc

