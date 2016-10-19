" set number line indication, `set nonu` to disable it
set nu
set term=xterm-256color
" Use smartindent
set smartindent
" Use spaces instead of tabs
set expandtab
" 1 tab = 4 spaces set tabstop=4
set shiftwidth=4

set softtabstop=4
set hls

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" for xml/html language programming
iabbrev </ </<C-X><C-O>

"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" for indent guide lines 
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" # settings for taglist
" Let Tlist be shown on the right
let Tlist_Use_Right_Window = 1 
" Only show one file tags
let Tlist_Show_One_File = 1 
" Start Tlist at first
let Tlist_Auto_Open=0
" Only one tag be open and others keep closed
let Tlist_File_Fold_Auto_Close=1


" my defined working IDE
function OpenMyIDE()
    "let cmdtype = getcmdtype()
    "echo cmdtype
    "if cmdtype == ':'
    "    echo 'command from :'
    "endif
    "set number
    exec 'NERDTreeToggle'
    "exec 'TlistToggle'
    exec 'TagbarToggle'
    "exec '<C-w-l>'
endfunction
" Bind key 'Ide' as command to show the IDE user interface
command! -nargs=0 -bar Ide call OpenMyIDE()
" Bind the key in normal usage
"nmap ide :call OpenMyIDE()<CR>
"
" Map key F9 to start Tagbar 
nmap <F9> :Ide<CR>


" Map key F8 to start Tagbar 
nmap <F8> :TagbarToggle<CR>


" or we can set cc=90 ( line column no more than 90 single lines)
" set cc=90
"
"



"let g:SuperTabRetainCompletionType=2
" 0 – 不记录上次的补全方式
"" 1 – 记住上次的补全方式,直到用其他的补全命令改变它
"" 2 – 记住上次的补全方式,直到按ESC退出插入模式为止
"
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"" 设置按下<Tab>后默认的补全方式, 默认是<C-P>,
"" 现在改为<C-X><C-O>. 关于<C-P>的补全方式,
"" 还有其他的补全方式,
"  你可以看看下面的一些帮助:
"" :help ins-completion
"" :help compl-omni
"
"
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8

" jedi settings
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_select_first = 1

"let g:jedi#show_call_signatures = "2"

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview=1
" airline theme by default it's dark
let g:airline_theme='badwolf'



"powerline的设置
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'unicode'
"let Powerline_symbols='compatible'
"}

" indentLine https://github.com/Yggdroot/indentLine
" Vim
let g:indentLine_color_term = 239

let g:indentLine_char = 'c'
let g:indentLine_enabled = 1


"set background=dark
set t_ut=


au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja


" To use csv.vim
" For more information please visit https://github.com/chrisbra/csv.vim

if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1
augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END


" Fix pasting with indent wrong
" Or you can do this to get rid of it      :set paste     after pasting then
" do :set nopaste  
set pastetoggle=<F2>

" set numbers.vim toggle on F3 between old ones
nnoremap <F3> :NumbersToggle<CR>

" Set Vim visual selection background color to be gray
hi Visual gui=NONE guibg=White guifg=Black


" ctrlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim

let [s:lcmap, s:prtmaps] = ['nn <buffer> <silent>', {                                                                                                                                              
    \ 'PrtBS()':              ['<bs>', '<c-]>'],                                                                                                                                               
    \ 'PrtDelete()':          ['<del>'],                                                                                                                                                       
    \ 'PrtDeleteWord()':      ['<c-w>'],                                                                                                                                                       
    \ 'PrtClear()':           ['<c-u>'],                                                                                                                                                       
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],                                                                                                                                             
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],                                                                                                                                               
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],                                                                                                                                           
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],                                                                                                                                             
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],                                                                                                                                       
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],                                                                                                                                   
    \ 'PrtHistory(-1)':       ['<c-n>'],                                                                                                                                                       
    \ 'PrtHistory(1)':        ['<c-p>'],                                                                                                                                                       
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],                                                                                                                                       
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],                                                                                                                                    
    \ 'AcceptSelection("t")': ['<c-t>'],                                                                                                                                                       
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],                                                                                                                                       
    \ 'ToggleFocus()':        ['<s-tab>'],                                                                                                                                                     
    \ 'ToggleRegex()':        ['<c-r>'],                                                                                                                                                       
    \ 'ToggleByFname()':      ['<c-d>'],                                                                                                                                                       
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],                                                                                                                                             
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],                                                                                                                                           
    \ 'PrtExpandDir()':       ['<tab>'],                                                                                                                                                       
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],                                                                                                                                   
    \ 'PrtInsert()':          ['<c-\>'],                                                                                                                                                       
    \ 'PrtCurStart()':        ['<c-a>'],                                                                                                                                                       
    \ 'PrtCurEnd()':          ['<c-e>'],                                                                                                                                                       
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],                                                                                                                                    
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],                                                                                                                                            
    \ 'PrtClearCache()':      ['<F5>'],                                                                                                                                                        
    \ 'PrtDeleteEnt()':       ['<F7>'],                                                                                                                                                        
    \ 'CreateNewFile()':      ['<c-y>'],                                                                                                                                                       
    \ 'MarkToOpen()':         ['<c-z>'],                                                                                                                                                       
    \ 'OpenMulti()':          ['<c-o>'],                                                                                                                                                       
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],                                                                                                                                     
    \ }]                                                                                                                                                                                       

let g:ctrlp_map = '<c-p>'                                                                                                                                                                          
let g:ctrlp_cmd = 'CtrlP'                                                                                                                                                                                                                                                                                                                                                                   
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux                                                                                                                                        
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows  

"syntax on
syntax enable

let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
"colorscheme peaksea
" Notice: theme molokayo will not show CtrlP even if it works very well.
colorscheme molokayo
"colorscheme molokai

" Want to hide .pyc files? Then add the following line:
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$'] "ignore files in NERDTree

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<leader>f"
let g:UltiSnipsJumpBackwardTrigger="<leader>b"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" this fixes backspace not erasing in Vim
set backspace=indent,eol,start " backspace over everything in insert mode



""""""""" Enabling plugin vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
