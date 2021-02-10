#!/bin/bash
# Works for Linux and MacOS
# Notice for MacOS bacause settings for everyone will be different,
# .zshrc .zsh/ .bashrc .gpg.rc .rtorrent.rc .pythonstartup will not be included
# fonts will not be installed in macOS either.

# Determain which OS
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
echo "[+] Your system is $platform, will set it up for you automatically"


#############################
# dotfiles
#############################
if [[ "$platform" == 'linux' ]]; then
    files=".bashrc .pythonstartup .vimrc .zshrc .muttrc .gpg.rc .rtorrent.rc"
elif [[ "$platform" == 'macos' ]]; then
    files=".muttrc"
fi

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

#############################
# update Tmux settings since Tmux v2.6 upgraded its key binding syntax
#############################
tmux_conf=".tmux.conf"
echo "[+] NOTICE: for tmux versioning installation, you need install UNIX tool bc firstly."
if [ -f $HOME/$tmux_conf ];then
   bak_file_loc=$HOME/$tmux_conf\.backup_$(date "+%Y%m%d%H%M%S")
   echo "[+] Backing up previous dot files settings: from "$tmux_conf" to $bak_file_loc"
   mv $HOME/$tmux_conf $bak_file_loc
   tv=`tmux -V | awk '{print $2}' | sed 's/[[:alpha:]]//g' `
   
   # for old tmux (still working on old/dated server...)
   threshold='2.6'

   # big upgrade for tmux since version 2.9
   threshold_2='2.9'
   #echo $tv
   
   # $tv is a double digit, bash only compares integer
   #if [ "$tv" -gt "2.6" ]; then
   # version before 2.6
   if [ `echo $tv\<$threshold | bc` -eq 1 ]; then 
       echo "[+] Found Tmux verion < 2.6"
       echo "[+] Updating tmux settings for version less than 2.6"
       cp -f "$tmux_conf".old $HOME/.tmux.conf
       #echo 'xiaoyu'
   else
   # if 2.9>version>=2.6 
       if [ `echo $tv\<$threshold_2 | bc` -eq 1 ]; then 
           echo "[+] Found Tmux verion >= 2.6"
           echo "[+] Updating tmux settings for version great equal than 2.6, less than 2.9"
           cp $tmux_conf  $HOME/
           #echo 'dayu'
   # if version>=2.9 
       else
           echo "[+] Found Tmux verion >= 2.9"
           echo "[+] Updating tmux settings for version great equal than 2.9"
           cp -f "$tmux_conf".ge_2.9  $HOME/.tmux.conf
       fi

   fi
else
    # copy a new .tmux.conf is there isn't any by default
    cp $tmux_conf  $HOME/
fi

#############################
# Elinks
#############################
elinks_conf=$HOME/.elinks/elinks.conf
if [ -f $elinks_conf ];then
    mv $elinks_conf $elinks_conf".backup_"$(date "+%Y%m%d%H%M%S")
    cp ./.elinks/elinks.conf $HOME/.elinks/
else
    cp -R ./.elinks $HOME/ 
fi

#############################
# Fonts, zsh and Vim plugins
#############################
# For Vim editor with its plugin powerline
echo "[+] Configuring and Installing Fonts for Vim Editor"

if [[ "$platform" == 'linux' ]]; then
    # Try to remove fonts cache
    rm -f /tmp/Powerline.cache
    #if [ -d $HOME/.fonts ];then
    #    true
    #else
    #    mkdir $HOME/.fonts -p
    mkdir -p $HOME/.fonts
    
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
        cp -R .vim/ $HOME/
    else
        cp -R .vim/ $HOME/
    fi
    
    echo "[+] Copying .zsh/ "
    if [ -d $HOME/.zsh ];then
        bak_file_loc=$HOME/.zsh.backup_$(date "+%Y%m%d%H%M%S")
        echo "[+] Backing up previous dot zsh files settings to $bak_file_loc "
        mv $HOME/.zsh $bak_file_loc
        cp -R .zsh/ $HOME/
    else
        cp -R .zsh/ $HOME/
    fi
    
    echo "[+] Copying rtorrent settings..."
    mkdir -p $HOME/Downloads/torrents/{rtorrent_sessions,rtorrent_temp,rtorrent_watch,rtorrent_completed}
    
    echo "[+] Copying .xdotool_mouse_key_bindings/ "
    if [ -d $HOME/.xdotool_mouse_key_bindings ];then
        bak_file_loc=$HOME/.xdotool_mouse_key_bindings.backup_$(date "+%Y%m%d%H%M%S")
        echo "[+] Backing up previous dot vim files settings to $bak_file_loc "
        mv $HOME/.xdotool_mouse_key_bindings $bak_file_loc
        cp -R .xdotool_mouse_key_bindings/ $HOME/
    else
        cp -R .xdotool_mouse_key_bindings/ $HOME/
    fi
    
    echo "[+] Creating directory for Go Language projects in $HOME/goworks/ ..."
    mkdir -p $HOME/goworks/
    
elif [[ "$platform"=='macos' ]]; then
    # do nothing with fonts in macos
    true
fi

echo "[+] You may restart a Shell and see the cumtom layouts in your Vim editor"

echo "[+] Finished! Try your new environment! By Alexander Liu :-)"
exit 0
