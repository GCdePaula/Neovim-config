
set termguicolors "set t_Co=256 turm=xterm-256color

""""""""""""""""""""
" Vim-plug
""""""""""
call plug#begin('~/.local/share/nvim/plugged')

"" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'

"" UI
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

call plug#end()
""""""""""""""""""""

"" Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium" " hard, medium or soft
colorscheme gruvbox " https://github.com/morhetz/gruvbox
" let ayucolor="light" " light, mirage or dark
"colorscheme ayu " https://github.com/ayu-theme/ayu-vim


"" NERDTree configs
function! ToggleNT()
    :NERDTreeToggle
    :NERDTreeMirror
endfunction
map <silent> <C-n> :call ToggleNT()<CR>

let g:NERDTreeWinPos = "right"
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" lightline
let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\               [ 'readonly', 'filename', 'modified', 'helloworld' ],
\               [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']]
\   },
\}

let g:lightline.component_expand = {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left',
\}

