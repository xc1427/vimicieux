" Startup {{{
if filereadable(glob('$VIMRUNTIME/vimrc_example.vim'))
  source $VIMRUNTIME/vimrc_example.vim "vimrc_example.vim also sources matchit.vim, default.vim
" let mapleader="\<space>" " map <Leader>
endif
" }}}

" Lang and Encoding {{{
set encoding=utf8
if has('win32')
  language English_United States
  let $LANG='en' " overrule the automatic choise of language on windows, see win32-gettext
elseif has('win32unix')
  language en_US.utf8
elseif has('unix')
  language en_US.UTF-8
endif
" }}}

" Terminal Config {{{
if has('unix')
  " Change cursor shape between mode in iTerm2.app
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode

  " Avoid escape timeout issues
  set timeoutlen=1000 ttimeoutlen=0

  " Set this to the name of your terminal that supports mouse codes.
  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
  " set ttymouse=xterm2

  " Set mouse=r to enable mouse selection when using vim on ssh machine
  set mouse=r "mouse=a in defaults.vim
endif
" }}}

" Pathogen.vim {{{
execute pathogen#infect()
syntax on
filetype plugin indent on
" To use Pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" git clone each plugin into ~/.vim/bundle/ directory
" }}}

" Netrw {{{
" let g:netrw_keepdir=0 " =0 keep the current directory the same as the browsing directory
let g:netrw_altfile=1
" }}}

" Misc {{{
set autoread
set backspace=indent,eol,start  " Backspace works like in normal text editor
" set clipboard+=unnamed  " make that the unnamed register is the same as the "* register.
if v:version > 702
  set formatoptions+=j    " Delete comment character when joining commented lines
endif
if &history < 1000
  set history=1000
endif
set ignorecase smartcase  " When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive
set keywordprg=         " Use Vim Help (no value given) when pressing K instead of man -s (defaut on mac)
set viewoptions=cursor,folds,slash,unix " Changes the effect of the :mkview command
set nobackup
set noswapfile
if v:version > 702
  set noundofile
endif
set nrformats-=octal    " numbers that start with a zero will be not considered to be octal.
set path=.              " ':find' search relative to the directory of the current file
set sessionoptions-=options,help
set shellslash          " forward slash is used when expanding file names
set wildignore=~*.*     " ignore hidden file in windows
" }}}

" Look {{{
set cursorline
set splitright splitbelow
set number
set ruler			" Show current position
set display=lastline  " More suitable display of @@@
set showcmd			" display partial command
set incsearch		" The matching string is highlighted while searching
set hlsearch		" Highlight search result
set scrolloff=3		" determines the number of context lines you would like to see above and below the cursor
if v:version > 702
  set breakindent   " Every wrapped line will continue visually indented. (Not support by vim 7.2 and earlier)
endif
" Make :set list (visible whitespace) prettier. Copied from sensible.vim
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set noequalalways
set textwidth=120
set wildmenu      " enabled by default.vim only after vim 7.4
set laststatus=2	" Show the status bar, enabled also by vim-airline
set background=dark
silent! colorscheme monokai
" }}}

" Indentation style and tab {{{
set tabstop=4     " tell vim how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide. Visual Studio expects each tab to be four columns wide. This is the only command here that will affect how existing text displays.
set shiftwidth=2  " control how many columns text is indented with the reindent operations (<< and >>), automatic C-style indentation, formatting filter (=), etc
set softtabstop=2 " control how many columns vim uses when you hit Tab in insert mode. If softtabstop does not equal to tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces.
set expandtab     " hitting Tab in insert mode will produce the appropriate number of spaces
set autoindent
set smarttab      " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'. 'tabstop' or 'softtabstop' is used in other places
" }}}

" Folding {{{
set foldlevelstart=20
augroup ft_fold
  au!
  autocmd FileType
        \ json
        \ setlocal foldmethod=syntax
  autocmd FileType
        \ xml
        \ setlocal foldmethod=indent
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType json,xml,vim normal zR " http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
augroup END
" }}}

" Quickfix window {{{
autocmd QuickFixCmdPost vimgrep* belowright cwindow
autocmd QuickFixCmdPost lvimgrep* belowright lwindow
autocmd QuickFixCmdPost grep botright cwindow
autocmd QuickFixCmdPost lgrep botright lwindow
" }}}

" FileType misc {{{
autocmd FileType html,scss,css setlocal iskeyword+=- " Enable html attribute to contain hyphen.
autocmd FileType npmrc setlocal commentstring=;\ %s " vim-comentary
" }}}

" Insert mode completion {{{
" Enable syntaxComplete. Place after any ':filetype' command:
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

set completeopt+=longest
set complete-=i " tpope set this in sensible.vim
" }}}

" Search tool {{{
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" Keymap improved {{{
noremap <Up> gk
noremap <Down> gj

" The 'smartcase' option only applies to search patterns that you type; it does not apply to * or # or gd. With following mappings, if 'smartcase' is on and you press * while on the word 'The', you will only find 'The' (case sensitive), but if you press * while on the word 'the', the search will not be case sensitive.
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Recover from accidental CTRL-U or CTRL-W
" Why? CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so that you can undo CTRL-U after inserting a line break. Same with CTRL-W
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" The following makes it possible to use the cursor keys in Insert mode, without breaking
" the undo sequence and therefore using |.| (redo) will work as expected.
inoremap <Left>  <C-G>U<Left>
inoremap <Right> <C-G>U<Right>
inoremap <expr> <Home> col('.') == match(getline('.'), '\S') + 1 ?
      \ repeat('<C-G>U<Left>', col('.') - 1) :
      \ (col('.') < match(getline('.'), '\S') ?
      \     repeat('<C-G>U<Right>', match(getline('.'), '\S') + 0) :
      \     repeat('<C-G>U<Left>', col('.') - 1 - match(getline('.'), '\S')))
inoremap <expr> <End> repeat('<C-G>U<Right>', col('$') - col('.'))

" Remap gm so the cursor is moved to the middle of the current physical line.
" Any leading or trailing whitespace is ignored: the cursor moves to the middle of the text between the first and last non-whitespace characters
function! s:Gm()
  execute 'normal! ^'
  let first_col = virtcol('.')
  execute 'normal! g_'
  let last_col  = virtcol('.')
  execute 'normal! ' . (first_col + last_col) / 2 . '|'
endfunction
nnoremap <silent> gm :call <SID>Gm()<CR>

" }}}

" Added functionality {{{

" Search for visual selected text
vnoremap // y/<C-R>"<CR>

" self defined text object /
onoremap <silent> i/ :<C-U>normal! T/vt/<CR>
onoremap <silent> a/ :<C-U>normal! F/vf/<CR>
xnoremap <silent> i/ :<C-U>normal! T/vt/<CR> " for it to work with visual mode
xnoremap <silent> a/ :<C-U>normal! F/vf/<CR> " for it to work with visual mode

" Use <C-L> to clear the highlighting of :set hlsearch.
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Go to directory of the current file
command! -bar CurFileDir execute "lcd " expand('%:p:h')

" Copy current file path
nnoremap <silent> <C-G>p :let @*=expand('%:p') <CR>
" }}}
