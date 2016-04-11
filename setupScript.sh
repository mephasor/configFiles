#!/bin/bash

echo "Creating temp file directory..."
mkdir ~/setupLogsTemp

echo "Installing GetDeb and PlayDeb..."
setupScripts/installGetdebPlayDeb 

echo "Repos and Packages..."
setupScripts/insPackagesAndRepos 



# Clean up 
setupScripts/cleanUp 


# ==================================================
# Dotfiles Setup
# =================================================
setupScripts/insDotFiles 
echo pwd

# ==================================================
# Vim Plugins and Stuff
# =================================================
echo "Installing vim stuff"
setupScripts/vimInstall 

