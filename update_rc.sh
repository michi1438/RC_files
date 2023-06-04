#!/bin/bash

git pull
mv ~/.bashrc ./backups/
mv ~/.lynxrc ./backups/
mv ~/.xpdfrc ./backups/
mv ~/.vimrc ./backups/
mv ~/.bash_profile ./backups/
ln .bashrc ~/
ln .lynxrc ~/
ln .xpdfrc ~/
ln .vimrc ~/
ln .bash_profile ~/
