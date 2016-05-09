#!/bin/bash

# Stop if errors happen
set -e

# Get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating temp file directory..."
mkdir ~/setupLogsTemp

# echo "Installing GetDeb and PlayDeb..."
# setupScripts/installGetdebPlayDeb 

echo "Repos and Packages..."
setupScripts/insPackagesAndRepos 



# Clean up 
setupScripts/cleanUp 


# ==================================================
# Dotfiles Setup
# =================================================
setupScripts/insDotFiles 

# ==================================================
# Vim Plugins and Stuff
# =================================================
echo "Installing vim stuff"
setupScripts/vimInstall 

echo "Installing spacemacs"
setupScripts/insSpacemacs

echo "Installing i3"
setupScripts/insI3


cd $DIR  
git submodule init
git submodule update
