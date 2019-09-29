
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
set tabstop=4 shiftwidth=4 softtabstop=0 expandtab
set smartindent autoindent smarttab

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

"" Allways show gutter, but not on nerdtree
set signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no

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


