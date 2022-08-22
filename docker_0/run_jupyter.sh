#! /bin/sh
tmux new -d -s "jupyter"
tmux send-keys -t jupyter "/opt/conda/bin/jupyter lab --no-browser --ip='*' --NotebookApp.password='sha1:1cd70af36a42:54f332c52c30068c2de631f3a0ae367772803c0f' --notebook-dir=/opt/ --port=8888 --allow-root" ENTER
