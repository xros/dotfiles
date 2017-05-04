## Vim Crosshairs

This plugin displays a crosshair over the cursor, similar to having
the cursorline or cursorcolumn settings enabled.  The trick is, the
crosshairs are only visible in the active window.  This can be handy
when you're lost in a sea of splits, vsplits, and quickfix windows.


### TODO

- Restore original cursorline name, it's better
- Make it handle vsplit (right now, both splits get a cursorline)
- Update the docfile!


### Installation

Using Pathogen:

   git clone https://github.com/bronson/vim-crosshairs ~/.vim/bundle/vim-crosshairs

By default the crosshairs won't be shown.  You must enable line, column,
or both in your vimrc like this:

    :set cursorline    " enable the horizontal line
    :set cursorcolumn  " enable the vertical line

If you want to set the color of the crosshairs, use something like this:

    highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NON 
    highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE


### Use

To disable the crosshairs for the current window:

    :setlocal nocursorline
    :setlocal nocursorcolumn

Or globally:

    :set nocursorline
    :set nocursorcolumn

And to force the crosshairs to always be visible in a particular window,
set a window-local variable

    :let w:persistent_cursorline = 1


### Origin

- Ingo Karkat wrote http://www.vim.org/scripts/script.php?script_id=4178
- This plugin was forked from https://github.com/vim-scripts/CursorLineCurrentWindow


### License

Same as the upstream plugin: Vim License, Charityware.
