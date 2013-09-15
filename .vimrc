" Use spaces instead of tabs
set expandtab
" 1 tab = 4 spaces
set tabstop=4
set shiftwidth=4

set softtabstop=4
set hls

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
iabbrev </ </<C-X><C-O>

execute pathogen#infect()
syntax on
filetype plugin indent on
