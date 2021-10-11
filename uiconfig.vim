
set termguicolors "set t_Co=256 turm=xterm-256color


"" colorscheme config
function! ColorAyu()
  set termguicolors "set t_Co=256 turm=xterm-256color
  let g:ayucolor="mirage"
  colorscheme ayu
  let g:lightline['colorscheme']='ayu'
endfunction

function! ColorAyuLight()
  set termguicolors "set t_Co=256 turm=xterm-256color
  let g:ayucolor="light"
  set background=light
  colorscheme ayu
  let g:lightline['colorscheme']='ayu'
endfunction

function! ColorGruvbox()
  let g:gruvbox_italic=1
  let g:gruvbox_contrast_dark="medium" " hard, medium or soft
  let g:gruvbox_contrast_light="hard" " hard, medium or soft

  set background=dark
  colorscheme gruvbox
  let g:lightline['colorscheme']='gruvbox'
endfunction




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


"" Set colorscheme
call ColorGruvbox()
" call ColorAyu()
