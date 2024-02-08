#!/bin/bash
#
#UPDATE_RC.SH_________________

git pull
declare -a arr=(".bashrc" ".lynxrc" ".xpdfrc" ".vimrc" ".bash_profile" ".gdbinit" ".vim_clang_tidy_config")

for i in "${arr[@]}"
do
	cp ./backups/"$i"  ./backups/"$i".old
	cp ~/"$i" ./backups/
	if [ ! -e  "$i" ]
	then
		cp ~/"$i" ./
	fi
	ln -f "$i" ~/
done

git add .
git commit -m "UPDATE_RC.SH `uname -nro`"
git push
	
#	cp ./backups/.bashrc  ./backups/.bashrc.old
#	cp ./backups/.lynxrc  ./backups/.lynxrc.old 
#	cp ./backups/.xpdfrc  ./backups/.xpdfrc.old 
#	cp ./backups/.vimrc  ./backups/.vimrc.old 
#	cp ./backups/.bash_profile ./backups/.bash_profile.old
#	cp ~/.bashrc ./backups/
#	cp ~/.lynxrc ./backups/
#	cp ~/.xpdfrc ./backups/
#	cp ~/.vimrc ./backups/
#	cp ~/.bash_profile ./backups/
#
#	ln -f .bashrc ~/
#	ln -f .lynxrc ~/
#	ln -f .xpdfrc ~/
#	ln -f .vimrc ~/
#	ln -f .bash_profile ~/
