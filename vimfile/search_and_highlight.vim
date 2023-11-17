" If you want this functionality, append it to your vimrc file.



" Search and highlight all words matching current word
function! s:SearchAndHighlight(bounded)
  let l:cword = escape(expand('<cword>'), '\')
  if (a:bounded)
    let l:search_pattern = '\<'. l:cword .'\>'
  else
    let l:search_pattern = l:cword
  endif
  call setreg('/', l:search_pattern)
  call histadd('search', l:search_pattern)
endfunction
nnoremap <silent> s :call <SID>SearchAndHighlight(1) <Bar> let &hlsearch=1 <Bar> if exists('g:loaded_indexed_search') <Bar> execute 'ShowSearchIndex' <Bar> endif <CR>
nnoremap <silent> gs :call <SID>SearchAndHighlight(0) <Bar> let &hlsearch=1 <Bar> if exists('g:loaded_indexed_search') <Bar> execute 'ShowSearchIndex' <Bar> endif <CR>
nnoremap <silent> <Leader>s :execute "let @/=\"\\\\\<".expand('<cword>')."\\\\\>\"" <Bar>execute "let &hlsearch=1" <Bar>execute "vimgrep /\\\<".expand('<cword>')."\\\>/gj %" <Bar>execute "bel cw" <CR>