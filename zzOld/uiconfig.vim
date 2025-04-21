set termguicolors "set t_Co=256 turm=xterm-256color

"" colorscheme config
function! ColorAyu()
  set termguicolors "set t_Co=256 turm=xterm-256color
  let g:ayucolor="mirage"
  colorscheme ayu
  " let g:lightline['colorscheme']='ayu'
endfunction

function! ColorAyuLight()
  set termguicolors "set t_Co=256 turm=xterm-256color
  let g:ayucolor="light"
  set background=light
  colorscheme ayu
endfunction

function! ColorGruvbox()
  let g:gruvbox_italic=1
  let g:gruvbox_contrast_dark="medium" " hard, medium or soft
  let g:gruvbox_contrast_light="hard" " hard, medium or soft

  set background=dark
  colorscheme gruvbox
endfunction

"" Set colorscheme
call ColorGruvbox()

"" nvim-tree configs
map <silent> <C-n> :NvimTreeToggle<CR>
autocmd FileType NvimTree setlocal signcolumn=no

"" nnn configs
" tnoremap <C-n> <cmd>NnnExplorer<CR>

"" NERDTree configs
" function! ToggleNT()
"     :NERDTreeToggle
"     :NERDTreeMirror
" endfunction
" map <silent> <C-n> :call ToggleNT()<CR>

"let g:netrw_dirhistmax = 0
"let g:NERDTreeWinPos = "right"
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable gutter on nerdtree
"autocmd FileType nerdtree setlocal signcolumn=no
