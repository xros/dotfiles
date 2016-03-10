Dot files
===
    Dot files for Bash, Zsh, Vim, Elinks, Mutt, Gnupg, Python, Rtorrent.
    A Python IDE for Vim is built in.
                          --- Created by xros
VIM Plugins including
---
*   ctags
*   jedi
*   csv.vim
*   taglist
*   NERDTree
*   ftplugin
*   supertab
*   emmet-vim
*   nerdcommenter
*   vim-powerline
*   vim-multiple-cursors
*   vim-python-pep8-indent
*   and so on , just check it out. For VIM 7.3+
*   Default Vim colorscheme is molokayo

Usage
----
* Use the script ```cp_files.sh``` to **backup** previous files and **replace** them within files in this project. The ```cp_files.sh``` will copy those dotfiles to the system user's home folder.
* These settings are shipped with configuration files for some common tools, including `Elinks, Vim, Mutt, Python(2/3), Zsh, Rtorrent, Golang-go, Ardupilot and etc.`
* Default Vim colorscheme is molokayo
* The bash scheme looks like this by default.
    ![console schema](static/snapshot111.png)


Explanation
----
* This is very neat for new PC initialization. Mostly for Debian/Ubuntu or its derived destros. This is friendly compaitble with Ubuntu12.04+/Linuxmint13+/Debian6+ and more their derived destros.

* Notice that: For some vim users to use taglist/ctags, they would need to install the package "ctags". For example on debian/ubuntu ```sudo apt-get install ctags``` , or on centOS/Fedora/RHEL ```sudo yum install ctags```, or on archlinux ```pacman -S ctags```
* The ```init_*.sh``` and the ```cp_files.sh``` are very neat for new users both on ubuntu12.04 and ubuntu14.04.
```init_ubuntu_12.04.sh``` is compatible with Debian7/Ubuntu12.04 while ```init_ubuntu_14.04.sh``` is for Ubuntu14.04.

#### Python IDE
* There's a Python IDE inside. Type **:Ide** in the Vim prompt console.
    ![Vim IDE](static/snapshot150.png)

#### HTML IDE
* There's a HTML IDE inside. It was detrived from [emmet-vim](https://github.com/mattn/emmet-vim).

## Quick Tutorial

Open or create a New File:

    vim index.html

Type something ( Notice: "\_" is the cursor position):

    html:5_

Then type `<c-y>,` (<kbd>Ctrl</kbd><kbd>y</kbd><kbd>,</kbd>), and you should see:

```html
<!DOCTYPE HTML>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <title></title>
</head>
<body>
        _
</body>
</html>
```

Type

```
test1
test2
test3
```

Then select these 3 lines using Vim Visualblocks keys -- <kbd>Shift</kbd><kbd>v</kbd>. Then press keys <kbd>Ctrl</kbd><kbd>y</kbd><kbd>,</kbd>, you will see what it shows as the followings. Please try it.


    ![Coding in HTML](static/emmet-vim-screenshot.gif)


[More Tutorials](https://raw.github.com/mattn/emmet-vim/master/TUTORIAL)

* More info about this tool can be found at [emmet-vim](https://github.com/mattn/emmet-vim).

#### CSV editor
* For csv/dat file editing using csv.vim
    ![Vim csv](static/snapshot37.png)
    
    The demo of CSV file editing:
    ![Vim csv demo](static/csv.gif)
    

##### Notice:
> If your csv file is very big, please do not edit it using Vim. It would be slow. Libreoffice is your friend. But viewing csv files in this manner makes me feel great.



#### Have Fun ####
By [xros](https://github.com/xros)

