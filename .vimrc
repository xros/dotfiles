set background=dark
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
syntax on
colorscheme peaksea

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
    exec 'TlistToggle'
    "exec '<C-w-l>'
endfunction
" Bind key 'Ide' as command to show the IDE user interface
command! -nargs=0 -bar Ide call OpenMyIDE()
" Bind the key in normal usage
"nmap ide :call OpenMyIDE()<CR>

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
