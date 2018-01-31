#!/bin/bash
files=".bashrc .pythonstartup .vimrc .zshrc .muttrc .gpg.rc .rtorrent.rc"
echo "[+] Copying dotfiles... Need to back up previous ones before overwriting"
for f in $files;do
    # copy those files to the user's $HOME folder
    if [ -f $HOME/$f ];then
        bak_file_loc=$HOME/$f\.backup_$(date "+%Y%m%d%H%M%S")
        echo "[+] Backing up previous dot files settings: from "$f" to $bak_file_loc"
        mv $HOME/$f $bak_file_loc
        cp $f  $HOME/
        #true
    else
        cp $f  $HOME/
    fi
    #echo $f
done

# update Tmux settings since Tmux v2.6 upgraded its key binding syntax
tmux_conf=".tmux.conf"
if [ -f $HOME/$tmux_conf ];then
   bak_file_loc=$HOME/$tmux_conf\.backup_$(date "+%Y%m%d%H%M%S")
   echo "[+] Backing up previous dot files settings: from "$tmux_conf" to $bak_file_loc"
   mv $HOME/$tmux_conf $bak_file_loc
   tv=`tmux -V | awk '{print $2}'`
   
   threshold='2.6'
   #echo $tv
   
   # $tv is a double digit, bash only compares integer
   #if [ "$tv" -gt "2.6" ]; then
   # version before 2.6
   if [ `echo $tv\<$threshold | bc` -eq 1 ]; then 
       echo "[+] Tmux verion < 2.6"
       echo "[+] Updating tmux settings for version less than 2.6"
       cp "$tmux_conf".old $HOME/.tmux.conf -f
       #echo 'xiaoyu'
   else
   # version after 2.6
       echo "[+] Tmux verion >= 2.6"
       echo "[+] Updating tmux settings for version great equal than 2.6"
       cp $tmux_conf  $HOME/
       #echo 'dayu'
   fi
fi

elinks_conf=$HOME/.elinks/elinks.conf
if [ -f $elinks_conf ];then
    mv $elinks_conf $elinks_conf".backup_"$(date "+%Y%m%d%H%M%S")
    cp ./.elinks/elinks.conf $HOME/.elinks/
else
    cp ./.elinks $HOME/ -R
fi

# For Vim editor with its plugin powerline
echo "[+] Configuring and Installing Fonts for Vim Editor"
# Try to remove fonts cache
rm /tmp/Powerline.cache -f
#if [ -d $HOME/.fonts ];then
#    true
#else
#    mkdir $HOME/.fonts -p
mkdir $HOME/.fonts -p

#echo "[ Configuring Fonts for Powerline Symbols]"
#if [ -f $HOME/.fonts/PowerlineSymbols.otf ];then
    #echo "[+] Removing Previous Fonts files"
    #rm -f $HOME/.fonts/PowerlineSymbols.otf
    #echo "[+] Installing Fonts"
    #cp ./.vim/bundle/powerline/font/PowerlineSymbols.otf $HOME/.fonts
#else
    #echo "[+] Installing Fonts"
    #cp ./.vim/bundle/powerline/font/PowerlineSymbols.otf $HOME/.fonts
#fi

# Installing Symbola fonts
echo "[+] Configuring Fonts for Symbola fonts for marks"
if [ -f $HOME/.fonts/Symbola.otf ];then
    echo "[+] Removing Previous Fonts files"
    rm -f $HOME/.fonts/Symbola.otf
    echo "[+] Installing Fonts"
    cp ./fonts/Symbola.otf $HOME/.fonts
else
    echo "[+] Installing Fonts"
    cp ./fonts/Symbola.otf $HOME/.fonts
fi

# Installing Input-Mono fonts
echo "[+] Configuring Fonts for Input-Mono fonts for coding"
if [ -f $HOME/.fonts/Input-Mono-Regular.ttf ];then
    echo "[+] Removing Previous Fonts files"
    rm -f $HOME/.fonts/Input-Mono-Regular.ttf
    echo "[+] Installing Fonts"
    cp ./fonts/Input-Mono-Regular.ttf $HOME/.fonts
else
    echo "[+] Installing Fonts"
    cp ./fonts/Input-Mono-Regular.ttf $HOME/.fonts
fi

echo "[+] Updating Fonts Cache"

fc-cache -vf $HOME/.fonts/ &>/dev/null

if [ -d $HOME/.config/fontconfig/conf.d ];then
    true
else
    mkdir $HOME/.config/fontconfig/conf.d -p
fi

#echo "[ Validating Fonts configuring files ]"
#if [ -f $HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf ];then
    #echo "[+] Removing Previous Fonts configuring files"
    #rm -f $HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf
    #echo "[+] Processing Fonts configuring files"
    #cp ./.vim/bundle/powerline/font/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
#else
    #echo "[+] Processing Fonts configuring files"
    #cp ./.vim/bundle/powerline/font/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d
#fi



echo "[+] Validating dotfiles..."
. $HOME/.bashrc

echo "[+] Copying .vim/ "
if [ -d $HOME/.vim ];then
    bak_file_loc=$HOME/.vim.backup_$(date "+%Y%m%d%H%M%S")
    echo "[+] Backing up previous dot vim files settings to $bak_file_loc "
    mv $HOME/.vim $bak_file_loc
    cp .vim/ -R $HOME/
else
    cp .vim/ -R $HOME/
fi

echo "[+] Copying rtorrent settings..."
mkdir -p $HOME/Downloads/torrents/{rtorrent_sessions,rtorrent_temp,rtorrent_watch,rtorrent_completed}

echo "[+] Copying .xdotool_mouse_key_bindings/ "
if [ -d $HOME/.xdotool_mouse_key_bindings ];then
    bak_file_loc=$HOME/.xdotool_mouse_key_bindings.backup_$(date "+%Y%m%d%H%M%S")
    echo "[+] Backing up previous dot vim files settings to $bak_file_loc "
    mv $HOME/.xdotool_mouse_key_bindings $bak_file_loc
    cp .xdotool_mouse_key_bindings/ -R $HOME/
else
    cp .xdotool_mouse_key_bindings/ -R $HOME/
fi

echo "[+] Creating directory for Go Language projects in $HOME/goworks/ ..."
mkdir $HOME/goworks/ -p

echo "[+] You may restart a Shell and see the cumtom layouts in your Vim editor"

echo "[+] Finished! Try your new environment! By Alexander Liu :-)"
exit 0
