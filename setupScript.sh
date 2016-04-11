#!/bin/bash

echo "Creating temp file directory..."
mkdir ~/setupLogsTemp

echo "Installing GetDeb and PlayDeb..."
setupScripts/installGetdebPlayDeb > ~/setupLogsTemp/getDebPlayDab.log

echo "Repos and Packages..."
setupScripts/insPackagesAndRepos > ~/setupLogsTemp/reposAndPackages.log



# Clean up 
setupScripts/cleanUp > ~/setupLogsTemp/cleanUp.log
# ==================================================
# Dotfiles Setup
# =================================================

# Create links to dotfiles
echo "Creating dotfile softlinks"
cd ~
rm .vimrc .bashrc .zshrc
ln -s Projects/configFiles/dotFiles/.vimrc .vimrc
ln -s Projects/configFiles/dotFiles/.bashrc .bashrc
ln -s Projects/configFiles/dotFiles/.zshrc .zshrc
ln -s Projects/configFiles/dotfiles/.tmux.conf .tmux.conf
# ==================================================
# Vim Plugins and Stuff
# =================================================
echo "Installing vim stuff"
setupScripts/vimInstall > ~/setupLogsTemp/vimInstall.log

