#!/bin/bash
# This is for new linux PC initialization which is installed debian/ubuntu

# To upgrade to the lastest
sudo apt-get update && sudo apt-get upgrade -y

# Applications
sudo apt-get install tmux tree fcitx fcitx-googlepinyin espeak arduino fritzing nmap  macchanger hydra john ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy mudlet chromium-browser git build-essential filezilla vim uget ipython python-dev python-pip python-virtualenv openssh-server mplayer testdisk fortune fortunes cookietool weechat cowsay stardict blender -y

# Twitter client for python
# Autocompletion tools and database libs for python
sudo apt-get install turpial python-mysqldb python-pymongo python-lxml -y


# To install setuptools
if [ -f /tmp/ez_setup.py ]; then
    true
else
    wget -c https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py /tmp/ez_setup.py
fi
sudo python /tmp/ez_setup.py


# To install some python libs as for environment
sudo pip install --upgrade jedi tornado flask pyramid bottle django web.py sqlalchemy supervisor BeautifulSoup -i http://pypi.douban.com/simple/

# To install wine emulator for windows apps
sudo apt-get install wine -y
echo 'Now the initialization have been fininshed'
# To install MySQL. User need to input his password while installation
#sudo apt-get install mysql-client mysql-server -y
