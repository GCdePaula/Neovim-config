
""""""""""""""""""""
" General
""""""""""
set nocompatible
set encoding=utf-8

"" Enable mouse
set mouse=a

"" Use system clipboard for copy/paste
set clipboard=unnamedplus

"" Maintain undo history between sessions.
set undofile " undodir default in neovim already works

"" Hide buffers instead of asking to save them
set hidden

"" Reload files on external change automatically
set autoread
au FocusGained * :checktime

"" Support all kind of EOLs
set fileformats+=mac

"" Redraw only when needed
set lazyredraw

""Search upwards for tags file instead only locally
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
""""""""""""""""""""


""""""""""""""""""""
" Text
""""""""""
"" Load filetype-specific indent files
filetype indent plugin on

"" Tab as four spaces
set tabstop=2 shiftwidth=2 softtabstop=1 expandtab
set smartindent autoindent "smarttab

"" Lines longer than window will wrap, breaking at a word,
"" and will continue indentation, plus a return symbol.
set wrap linebreak breakindent
let &showbreak='↳ '
set display+=lastline

"" Show hidden characters
set listchars=tab:→\|,trail:•,extends:⟩,precedes:⟨,nbsp:␣
set list

"" Delete comment character when joining commented lines
set formatoptions+=j

"" Increment ignores octal format
set nrformats-=octal

"" Change backspace behaviour
set backspace=indent,eol,start

"" Remove included files from autocomplete
set complete-=i

"" Better matching
runtime macros/matchit.vim
""""""""""""""""""""


""""""""""""""""""""
" UI Layout
""""""""""
"" Shows title in window.
set title

"" Line number style
set number "relativenumber

"" Show command line in bottom bar
set showcmd

"" Highlight current line
set cursorline

"" Show ruler
set ruler

"" Autocomplete for command menu
set wildmenu

" Always show statusline
set laststatus=2

"" Keeps one line above/below cusror when scrolling
set scrolloff=1

"" Better split behaviour
set splitbelow
set splitright
""""""""""""""""""""


""""""""""""""""""""
" Searching
""""""""""
"" Search as characters are entered
set incsearch

"" Highlight search results
set hlsearch

"" Ignore case when searching, except when search contains
"' capital letter.
set ignorecase smartcase

"" Highlight matching [({})]
set showmatch
"""""""""""""""""""


""""""""""""""""""""
" Key mappings
""""""""""
let mapleader=","
xnoremap <silent> <leader>p p:let @+=@0<CR>
nnoremap <leader>dd "_dd
nnoremap <silent> <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

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
" Useful indent functions
""""""""""
function! SetIndent8()
  :set tabstop=8 shiftwidth=8
endfunction

function! SetIndent4()
  :set tabstop=4 shiftwidth=4
endfunction

function! SetIndent2()
  :set tabstop=2 shiftwidth=2
endfunction

map <leader>8 :call SetIndent8()<CR>
map <leader>4 :call SetIndent4()<CR>
map <leader>2 :call SetIndent2()<CR>

function! UseTabs()
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
endfunction

function! UseSpaces()
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=1 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
"  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
""""""""""""""""""""

