#! /bin/bash

# Install plugins using Vim 8.0 native package management
mkdir -p ~/.vim/pack/default/start

# Install plugins
git clone https://github.com/vim-scripts/mru.vim.git ~/.vim/pack/default/start/mru.vim &
git clone https://github.com/tpope/vim-commentary.git ~/.vim/pack/default/start/vim-commentary &
git clone https://github.com/google/vim-searchindex.git ~/.vim/pack/default/start/vim-searchindex &
git clone https://github.com/felipec/vim-sanegx.git ~/.vim/pack/default/start/vim-sanegx
