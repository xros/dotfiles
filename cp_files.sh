#!/bin/bash
files=".bashrc .pythonstartup .tmux.conf .vimrc .zshrc"
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

# For Vim editor with its plugin vim-powerline
echo "Configuring and Installing Fonts for Vim Editor"
# Try to remove fonts cache
rm /tmp/Powerline.cache -f
#if [ -d $HOME/.fonts ];then
#    true
#else
#    mkdir $HOME/.fonts -p
mkdir $HOME/.fonts -p

echo "[ Configuring Fonts ]"
if [ -f $HOME/.fonts/PowerlineSymbols.otf ];then
    echo "-----Removing Previous Fonts files"
    rm -f $HOME/.fonts/PowerlineSymbols.otf
    echo "-----Installing Fonts"
    cp ./.vim/bundle/vim-powerline/fontpatcher/PowerlineSymbols.otf $HOME/.fonts
else
    echo "-----Installing Fonts"
    cp ./.vim/bundle/vim-powerline/fontpatcher/PowerlineSymbols.otf $HOME/.fonts
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



echo "Validating dotfiles..."
. $HOME/.bashrc

echo "Copying .vim/ "
if [ -d $HOME/.vim ];then
    echo "Backuping previous dot vim files settings... "
    mv $HOME/.vim $HOME/.vim.backup_$(date "+%Y%m%d%H%M%S")
    cp .vim/ -R $HOME/
else
    cp .vim/ -R $HOME/
fi


echo "You may restart X service to see the cumtom symbols in Vim editor"

echo "Copying finished!"
echo "Try your new environment! :-)"
exit 0