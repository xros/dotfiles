" crosshairs.vim
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.


" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_vim_crosshairs') || (v:version < 700)
    finish
endif
let g:loaded_vim_crosshairs = 1


"- functions -------------------------------------------------------------------

" Note: We use both global and local values of 'cursorline' to store the states,
" though 'cursorline' is window-local and only the &l:cursorline value
" effectively determines the visibility of the highlighting. This makes for a
" better value inheritance when splitting windows than a separate window-local
" variable would.

function! s:CursorLineOnEnter()
    if s:cursorline
	if &g:cursorline || exists('w:persistent_cursorline') && w:persistent_cursorline
	    setlocal cursorline
	else
	    setglobal cursorline
	endif
    else
	setlocal nocursorline
    endif
    if s:cursorcolumn
	if &g:cursorcolumn || exists('w:persistent_cursorcolumn') && w:persistent_cursorcolumn
	    setlocal cursorcolumn
	else
	    setglobal cursorcolumn
	endif
    else
	setlocal nocursorcolumn
    endif
endfunction


function! s:CursorLineOnLeave()
    if s:cursorline
	if &l:cursorline
	    if ! &g:cursorline
		" user did :setlocal cursorline
		set cursorline
	    endif
	else
	    if &g:cursorline
		" user did :setlocal nocursorline
		set nocursorline
	    else
		" user did :set nocursorline
		let s:cursorline = 0
	    endif
	endif

	if exists('w:persistent_cursorline') && w:persistent_cursorline
	    setglobal nocursorline
	    setlocal cursorline
	else
	    setlocal nocursorline
	endif
    else
	if &g:cursorline && &l:cursorline
	    " user did :set cursorline
	    let s:cursorline = 1
	endif
    endif
    if s:cursorcolumn
	if &l:cursorcolumn
	    if ! &g:cursorcolumn
		" user did :setlocal cursorcolumn
		set cursorcolumn
	    endif
	else
	    if &g:cursorcolumn
		" user did :setlocal nocursorcolumn
		set nocursorcolumn
	    else
		" user did :set nocursorcolumn
		let s:cursorcolumn = 0
	    endif
	endif

	if exists('w:persistent_cursorcolumn') && w:persistent_cursorcolumn
	    setglobal nocursorcolumn
	    setlocal cursorcolumn
	else
	    setlocal nocursorcolumn
	endif
    else
	if &g:cursorcolumn && &l:cursorcolumn
	    " user did :set cursorcolumn
	    let s:cursorcolumn = 1
	endif
    endif
endfunction


"- autocmds --------------------------------------------------------------------

let s:cursorline = &g:cursorline
let s:cursorcolumn = &g:cursorcolumn

augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call <SID>CursorLineOnEnter()
    autocmd WinLeave                      * call <SID>CursorLineOnLeave()
augroup END
