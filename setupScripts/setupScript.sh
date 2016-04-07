#!/bin/bash

./installGetdebPlayDeb


# Add repositories needed
sudo sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

# Take care of encrypted DVDs
./installDVDStuff

# Update the repos
sudo apt-get update



# Install updates
sudo apt-get -y  upgrade
sudo apt-get -y dist-upgrade

# Install packages
sudo apt-get install -y git zsh python3.5 python-dev python3-dev python-pip python3-pip terminator 
sudo apt-get install -y python3.5-dev build-essential libssl-dev libffi-dev
sudo apt-get install -y synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager bleachbit openjdk-7-jre oracle-java8-installer flashplugin-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libswscale-extra-2 ubuntu-restricted-extras ubuntu-wallpapers*

#Install Chrome
./installChrome

# Install Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Clean up 
./cleanUp
# ==================================================
# Dotfiles Setup
# =================================================

# Create links to dotfiles
cd ~
rm .vimrc .bashrc .zshrc
ln -s Projects/configFiles/dotFiles/.vimrc .vimrc
ln -s Projects/configFiles/dotFiles/.bashrc .bashrc
ln -s Projects/configFiles/dotFiles/.zshrc .zshrc

# ==================================================
# Vim Plugins and Stuff
# =================================================
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

