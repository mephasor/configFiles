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
setupScripts/insDotFiles > ~/setupLogsTemp/dotFiles.log
echo pwd

# ==================================================
# Vim Plugins and Stuff
# =================================================
echo "Installing vim stuff"
setupScripts/vimInstall > ~/setupLogsTemp/vimInstall.log

