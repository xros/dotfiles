set background=dark
" Use spaces instead of tabs
set expandtab
" 1 tab = 4 spaces set tabstop=4
set shiftwidth=4

set softtabstop=4
set hls

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
iabbrev </ </<C-X><C-O>

"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
colorscheme peaksea

" for indent guide lines 
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" Let Tlist be shown on the right
let Tlist_Use_Right_Window = 1 
" or we can set cc=90 ( line column no more than 90 single lines)
" set cc=90
