" Vim Plug {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Enhanced editing, navigation & experience {{{
Plug 'tpope/vim-surround'
let g:surround_92 = "\\\r\\"

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-vinegar'

Plug 'jiangmiao/auto-pairs'

" This plugin redefines 6 search commands (/,?,n,N,*,#).
" At every search command, it automatically prints 'At match #N out of M matches'.
Plug 'henrik/vim-indexed-search'
let g:indexed_search_numbered_only = 1

Plug 'vim-scripts/restore_view.vim'
" let g:skipview_files = ['*\.vim']

" This plugin is for highlighting the matching tag
Plug 'gregsexton/matchtag'
" }}}

" Helper & New functionality {{{
Plug 'vim-scripts/mru.vim'

Plug 'vim-scripts/BufOnly.vim'

Plug 'airblade/vim-rooter'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_manual_only = 1 " use Rooter command manually
let g:rooter_use_lcd = 1

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
let g:gitgutter_signs = 0 " toggle with :GitGutterSignsToggle
set updatetime=100

" ---

Plug 'godlygeek/tabular'

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_mode = 'i'
imap   <Tab>p   <plug>(emmet-move-prev)
nmap   <Tab>p   <plug>(emmet-move-prev)
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,sass,scss,less,text,javascript,markdown EmmetInstall

Plug 'rizzatti/dash.vim'
nmap <silent> gK <Plug>DashSearch
" }}}

" Look and syntax {{{
Plug 'sickill/vim-monokai'

Plug 'vim-airline/vim-airline'
function! AirlineInit()
  let g:airline_section_c = airline#section#create(['readonly', ' ', 'path'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

Plug 'ap/vim-css-color'

" ---

Plug 'pangloss/vim-javascript'

Plug 'mxw/vim-jsx'

Plug 'othree/javascript-libraries-syntax.vim'

Plug 'othree/html5.vim'
" }}}

" Initialize plugin system
call plug#end()
" }}}