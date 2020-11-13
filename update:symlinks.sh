#!/usr/bin/env bash

#==============================================================================#
# Google Drive Symlinks
#==============================================================================#
if [ -d "/Volumes/GoogleDrive" ]; then
  for dir in Applications Books Documents Documents/Computers Games Music Pictures Projects Projects/YouTube Projects/YouTube/Assets Projects/YouTube/gsc; do
    #------------------------------------------------------------------------------------#
    # Applications/Documents/Games/Music/Pictures/Projects: find type symlink and remove
    #------------------------------------------------------------------------------------#
    cd ~/$dir
    fd --type l --exec rm
    #-----------------------------------------------------------------------------------------------#
    # Applications/Documents/Games/Music/Pictures/Projects: find type directory and create symlinks
    #-----------------------------------------------------------------------------------------------#
    cd "/Volumes/GoogleDrive/My Drive/$dir"
    fd --type d --max-depth 1 --exec ln -s "$(pwd)/{}" ~/$dir
  done
fi

#==============================================================================#
# Adler Symlinks
#==============================================================================#
if [ -d "/Volumes/Adler" ]; then
  for dir in Documents Documents/Computers Games Pictures; do
    #--------------------------------------------------------#
    # Documents/Games/Pictures: find type symlink and remove
    #--------------------------------------------------------#
    # cd ~/$dir
    # fd --type l --exec rm
    #-------------------------------------------------------------------#
    # Documents/Games/Pictures: find type directory and create symlinks
    #-------------------------------------------------------------------#
    cd "/Volumes/Adler/$dir"
    fd --type d --max-depth 1 --exec ln -s "$(pwd)/{}" ~/$dir
  done

  #--------------------------------------#
  # Videos: find type symlink and remove
  #--------------------------------------#
  cd ~/Movies
  fd --type l --exec rm
  #-------------------------------------------------#
  # Videos: find type directory and create symlinks
  #-------------------------------------------------#
  cd "/Volumes/Adler/Videos"
  fd --type d --max-depth 1 --exec ln -s "$(pwd)/{}" ~/Movies
fi
