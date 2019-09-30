
set termguicolors "set t_Co=256 turm=xterm-256color


"" Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium" " hard, medium or soft
let g:gruvbox_contrast_light="hard" " hard, medium or soft
set background=dark
colorscheme gruvbox


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

" Disable gutter on nerdtree
autocmd FileType nerdtree setlocal signcolumn=no


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


