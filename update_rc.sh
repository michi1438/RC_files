#!/bin/bash
#
#UPDATE_RC.SH_________________

git pull
cp ./backups/.bashrc  ./backups/.bashrc.old
cp ./backups/.lynxrc  ./backups/.lynxrc.old 
cp ./backups/.xpdfrc  ./backups/.xpdfrc.old 
cp ./backups/.vimrc  ./backups/.vimrc.old 
cp ./backups/.bash_profile ./backups/.bash_profile.old
cp ~/.bashrc ./backups/
cp ~/.lynxrc ./backups/
cp ~/.xpdfrc ./backups/
cp ~/.vimrc ./backups/
cp ~/.bash_profile ./backups/

ln -f .bashrc ~/
ln -f .lynxrc ~/
ln -f .xpdfrc ~/
ln -f .vimrc ~/
ln -f .bash_profile ~/
