
""""""""""""""""""""
" Key mappings
""""""""""
let mapleader=","
xnoremap <silent> <leader>p p:let @+=@0<CR>
nnoremap <leader>dd "_dd
nnoremap <silent> <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

"" Y yanks from the cursor to the end of line
nnoremap Y y$

"" Makes Ctrl-U in insert mode more forgiving
inoremap <C-U> <C-G>u<C-U>

"" Toggle list mode
nmap <leader>l :set list!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""""""""""""""""""


""""""""""""""""""""
" Useful functions
""""""""""

function! SetIndent4()
  :set tabstop=4 shiftwidth=4
endfunction

function! SetIndent2()
  :set tabstop=2 shiftwidth=2
endfunction

map <leader>2 :call SetIndent2()<CR>
map <leader>4 :call SetIndent4()<CR>

function! UseTabs()
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
""""""""""""""""""""

