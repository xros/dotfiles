" Vim color file - download_script_php_src_id_20978_modified
" Generated by http://bytefluent.com/vivify 2016-10-21
" http://bytefluent.com/vivify/index.php?remote=www.vim.org%2Fscripts%2Fdownload_script.php%3Fsrc_id%3D20978
" By Alexander Liu -- https://github.com/xros
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "raincode"

"hi SignColumn -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi ErrorMsg -- no settings --
hi Normal guifg=#e0e0e0 guibg=#242424 guisp=#242424 gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi ModeMsg -- no settings --
"hi EnumerationName -- no settings --
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi Error -- no settings --
"hi DefinedName -- no settings --
"hi PMenuThumb -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi Directory -- no settings --
"hi clear -- no settings --
hi IncSearch guifg=#33ff1c guibg=#000000 guisp=#000000 gui=underline ctermfg=10 ctermbg=NONE cterm=underline
hi WildMenu guifg=#33ff1c guibg=#000000 guisp=#000000 gui=underline ctermfg=10 ctermbg=NONE cterm=underline
hi SpecialComment guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi Typedef guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Title guifg=#f6f3e8 guibg=NONE guisp=NONE gui=bold ctermfg=230 ctermbg=NONE cterm=bold
hi Folded guifg=#a0a8b0 guibg=#384048 guisp=#384048 gui=NONE ctermfg=103 ctermbg=238 cterm=NONE
hi PreCondit guifg=#008faf guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi Include guifg=#008faf guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi Float guifg=#00ab11 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#857b6f guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=101 ctermbg=234 cterm=NONE
hi NonText guifg=#99968b guibg=#242424 guisp=#242424 gui=NONE ctermfg=246 ctermbg=235 cterm=NONE
hi DiffText guifg=NONE guibg=#003c4c guisp=#003c4c gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi Ignore guifg=#242424 guibg=NONE guisp=NONE gui=NONE ctermfg=235 ctermbg=NONE cterm=NONE
hi Debug guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#333333 guisp=#333333 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Identifier guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Todo guifg=#ff4444 guibg=#333333 guisp=#333333 gui=bold ctermfg=203 ctermbg=236 cterm=bold
hi Special guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi LineNr guifg=#444444 guibg=#242424 guisp=#242424 gui=NONE ctermfg=238 ctermbg=235 cterm=NONE
hi StatusLine guifg=#a0a0a0 guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=247 ctermbg=234 cterm=NONE
hi Label guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#121212 guibg=#cae682 guisp=#cae682 gui=NONE ctermfg=233 ctermbg=150 cterm=NONE
hi Search guifg=NONE guibg=#000000 guisp=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Delimiter guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi Statement guifg=#fa2562 guibg=NONE guisp=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Comment guifg=#99968b guibg=NONE guisp=NONE gui=italic ctermfg=246 ctermbg=NONE cterm=NONE
hi Character guifg=#ffa1cf guibg=NONE guisp=NONE gui=NONE ctermfg=218 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#ffffff guibg=NONE guisp=NONE gui=bold ctermfg=15 ctermbg=NONE cterm=bold
hi Number guifg=#00ab11 guibg=NONE guisp=NONE gui=NONE ctermfg=34 ctermbg=NONE cterm=NONE
hi Boolean guifg=#8ac6f2 guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Operator guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLineFill guifg=#e0e0e0 guibg=#444444 guisp=#444444 gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
hi DiffDelete guifg=#731b00 guibg=#400f00 guisp=#400f00 gui=NONE ctermfg=3 ctermbg=52 cterm=NONE
hi CursorColumn guifg=NONE guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Define guifg=#008faf guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi Function guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#ff99ff guibg=#000000 guisp=#000000 gui=NONE ctermfg=213 ctermbg=NONE cterm=NONE
hi PreProc guifg=#008faf guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi Visual guifg=NONE guibg=#000000 guisp=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit guifg=#1c1c1c guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=234 ctermbg=234 cterm=NONE
hi Exception guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Keyword guifg=#8ac6f2 guibg=NONE guisp=NONE gui=NONE ctermfg=117 ctermbg=NONE cterm=NONE
hi Type guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi DiffChange guifg=NONE guibg=#1b0042 guisp=#1b0042 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi Cursor guifg=NONE guibg=#666666 guisp=#666666 gui=NONE ctermfg=NONE ctermbg=241 cterm=NONE
hi PMenu guifg=#f6f3e8 guibg=#444444 guisp=#444444 gui=NONE ctermfg=230 ctermbg=238 cterm=NONE
hi SpecialKey guifg=#d090ff guibg=#242424 guisp=#242424 gui=NONE ctermfg=177 ctermbg=235 cterm=NONE
hi Constant guifg=#ffa1cf guibg=NONE guisp=NONE gui=NONE ctermfg=218 ctermbg=NONE cterm=NONE
hi Tag guifg=#ffddaa guibg=NONE guisp=NONE gui=NONE ctermfg=223 ctermbg=NONE cterm=NONE
hi String guifg=#98ff85 guibg=NONE guisp=NONE gui=italic ctermfg=120 ctermbg=NONE cterm=NONE
hi MatchParen guifg=#98ff85 guibg=#242424 guisp=#242424 gui=bold ctermfg=120 ctermbg=235 cterm=bold
hi Repeat guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Structure guifg=#ffff99 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Macro guifg=#008faf guibg=NONE guisp=NONE gui=NONE ctermfg=31 ctermbg=NONE cterm=NONE
hi Underlined guifg=#80a0ff guibg=NONE guisp=NONE gui=underline ctermfg=12 ctermbg=NONE cterm=underline
hi DiffAdd guifg=NONE guibg=#003300 guisp=#003300 gui=NONE ctermfg=NONE ctermbg=22 cterm=NONE
hi TabLine guifg=#e0e0e0 guibg=#444444 guisp=#444444 gui=NONE ctermfg=254 ctermbg=238 cterm=NONE
hi colorcolumn guifg=NONE guibg=#000000 guisp=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi cursorlinenr guifg=#4f4f4f guibg=#303030 guisp=#303030 gui=NONE ctermfg=239 ctermbg=236 cterm=NONE
