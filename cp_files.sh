#!/bin/bash
files=".bashrc .pythonstartup .tmux.conf .vimrc .zshrc .muttrc .gpg.rc .rtorrent.rc"
echo "Copying dotfiles... Need to backup previous ones before overwriting"
for f in $files;do
    # copy those files to the user's $HOME folder
    if [ -f $HOME/$f ];then
        echo "Backuping previous dot files settings: "$f" ..."
        mv $HOME/$f $HOME/$f\.backup_$(date "+%Y%m%d%H%M%S")
        cp $f  $HOME/
        #true
    else
        cp $f  $HOME/
    fi
    #echo $f
done

elinks_conf=$HOME/.elinks/elinks.conf
if [ -f $elinks_conf ];then
    mv $elinks_conf $elinks_conf".backup_"$(date "+%Y%m%d%H%M%S")
    cp ./.elinks/elinks.conf $HOME/.elinks/
else
    cp ./.elinks $HOME/ -R
fi

# For Vim editor with its plugin vim-powerline
echo "Configuring and Installing Fonts for Vim Editor"
# Try to remove fonts cache
rm /tmp/Powerline.cache -f
#if [ -d $HOME/.fonts ];then
#    true
#else
#    mkdir $HOME/.fonts -p
mkdir $HOME/.fonts -p

echo "[ Configuring Fonts for Powerline Symbols]"
if [ -f $HOME/.fonts/PowerlineSymbols.otf ];then
    echo "-----Removing Previous Fonts files"
    rm -f $HOME/.fonts/PowerlineSymbols.otf
    echo "-----Installing Fonts"
    cp ./.vim/bundle/vim-powerline/font/PowerlineSymbols.otf $HOME/.fonts
else
    echo "-----Installing Fonts"
    cp ./.vim/bundle/vim-powerline/font/PowerlineSymbols.otf $HOME/.fonts
fi

# Installing Symbola fonts
echo "[ Configuring Fonts for Symbola fonts]"
if [ -f $HOME/.fonts/Symbola.otf ];then
    echo "-----Removing Previous Fonts files"
    rm -f $HOME/.fonts/Symbola.otf
    echo "-----Installing Fonts"
    cp ./fonts/Symbola.otf $HOME/.fonts
else
    echo "-----Installing Fonts"
    cp ./fonts/Symbola.otf $HOME/.fonts
fi

echo "[ Updating Fonts Cache ]"

fc-cache -vf $HOME/.fonts/

if [ -d $HOME/.config/fontconfig/conf.d ];then
    true
else
    mkdir $HOME/.config/fontconfig/conf.d -p
fi

echo "[ Validating Fonts configuring files ]"
if [ -f $HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf ];then
    echo "-----Removing Previous Fonts configuring files"
    rm -f $HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf
    echo "-----Processing Fonts configuring files"
    cp ./.vim/bundle/vim-powerline/fontpatcher/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
else
    echo "-----Processing Fonts configuring files"
    cp ./.vim/bundle/vim-powerline/fontpatcher/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
fi



echo "-----Validating dotfiles..."
. $HOME/.bashrc

echo "-----Copying .vim/ "
if [ -d $HOME/.vim ];then
    echo "-----Backuping previous dot vim files settings... "
    mv $HOME/.vim $HOME/.vim.backup_$(date "+%Y%m%d%H%M%S")
    cp .vim/ -R $HOME/
else
    cp .vim/ -R $HOME/
fi

echo "-----Copying rtorrent settings..."
mkdir -p $HOME/Downloads/torrents/{rtorrent_sessions,rtorrent_temp,rtorrent_watch,rtorrent_completed}

echo "-----Creating directory for Go Language projects in $HOME/goworks/ ..."
mkdir $HOME/goworks/ -p

echo "You may restart a SHELL to see the cumtom symbols in Vim editor"

echo "Copying finished!"
echo "Try your new environment! :-)"
exit 0
