#! /bin/bash

# Install Pathogen:
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
git clone https://github.com/vim-scripts/mru.vim.git ~/.vim/bundle/mru.vim &
git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary &
git clone https://github.com/sickill/vim-monokai.git ~/.vim/bundle/vim-monokai &
git clone https://github.com/google/vim-searchindex.git ~/.vim/bundle/vim-searchindex
