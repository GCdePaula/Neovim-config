


""""""""""""""""""""
" Misc
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
" set lazyredraw

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
" Colors
"""""""""""
"" Terminal color
set termguicolors "set t_Co=256 turm=xterm-256color

"" Enable syntax highlight
syntax enable

"" Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium" " hard, medium or soft
colorscheme gruvbox " https://github.com/morhetz/gruvbox
" let ayucolor="mirage" " light, mirage or dark
" colorscheme ayu " https://github.com/ayu-theme/ayu-vim
""""""""""""""""""""


""""""""""""""""""""
" Key mappings
""""""""""
let mapleader=","
xnoremap <silent> <leader>p p:let @+=@0<CR>
nnoremap <leader>dd "_dd
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
"nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

"" Y yanks from the cursor to the end of line
nnoremap Y y$

"" Makes Ctrl-U in insert mode more forgiving
inoremap <C-U> <C-G>u<C-U>

"" Toggle list mode
nmap <leader>l :set list!<CR>
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
set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨,nbsp:␣
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
set number " relativenumber

"" Show command line in bottom bar
set showcmd

"" Highlight current line
set cursorline

"" Allways show gutter
"set signcolumn=yes

"" Show ruler
set ruler

"" Autocomplete for command menu
set wildmenu

" Always show statusline
set laststatus=2

"" Keeps one line above/below cusror when scrolling
set scrolloff=1
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

"" Highlight extra whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
"""""""""""""""""""


""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'tpope/vim-sensible'

"" Scrolling feedback
" Plug 'joeytwiddle/sexy_scroller.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"" Languages specific plugins
Plug 'tomlion/vim-solidity' " , { 'for': 'solidity' }
Plug 'pangloss/vim-javascript' " , {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty' " , {'for': 'javascript'}

"" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" Linter
" Plug 'w0rp/ale'

call plug#end()
""""""""""""""""""""


""""""""""""""""""""
" Plug-in configuration
""""""""""

"" Don't animate cursor on scrolling, better for mouse/trackpad
" let g:SexyScroller_CursorTime = 0

"" NERDTree configs
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" Start deoplete at startup
let g:deoplete#enable_at_startup = 1

