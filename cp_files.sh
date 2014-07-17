#!/bin/bash
files=".bashrc .pythonstartup .tmux.conf .vimrc .zshrc"
echo "Copying dotfiles... Need to delete previous ones before overwriting"
for f in $files;do
    # copy those files to the user's $HOME folder
    if [ -f $HOME/$f ];then
        mv $HOME/$f $HOME/$f\.backup_$(date "+%Y%m%d%H%M%S")
        cp $f  $HOME/
        #true
    else
        cp $f  $HOME/
    fi
    #echo $f
done

echo "Validating dotfiles..."
. $HOME/.bashrc

echo "Copying .vim/ "
if [ -d $HOME/.vim ];then
    mv $HOME/.vim $HOME/.vim.backup_$(date "+%Y%m%d%H%M%S")
    cp .vim/ -R $HOME/
else
    cp .vim/ -R $HOME/
fi

echo "Copying finished"
exit 0
