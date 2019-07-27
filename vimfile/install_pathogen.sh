#! /bin/bash

# Install Pathogen:
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
git clone git://github.com/vim-scripts/mru.vim.git ~/.vim/bundle/mru.vim &
git clone git://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary &
git clone git://github.com/tpope/vim-vinegar.git ~/.vim/bundle/vim-vinegar &
git clone git://github.com/sickill/vim-monokai.git ~/.vim/bundle/vim-monokai &
git clone git://github.com/google/vim-searchindex.git ~/.vim/bundle/vim-searchindex
