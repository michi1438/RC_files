#!/bin/bash
#
#UPDATE_RC.SH_________________

git add -v .
git commit -v -m "PULL -- UPDATE_RC.SH `uname -nro`"
git pull --no-rebase
declare -a arr=(".config/qutebrowser/config.py" ".config/sway/config" ".bashrc" \
	".lynxrc" ".xpdfrc" ".vimrc" ".bash_profile" ".gdbinit" i			\
	".vim_clang_tidy_config")

if [ ! -d "./backups/" ]; then
	mkdir ./backups/
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

for i in "${arr[@]}"
do
	IS_DIFF=$(diff -ur ./"$i" ~/"$i")
	if [ ! -z "$IS_DIFF" ] ; then
		date >> ./backups/"$i".diff
		uname -nro >> ./backups/"$i".diff
		echo "${IS_DIFF}" >> ./backups/"$i".diff
	fi
	if [ ! -e  "$i" ]
	then
		cp -vr  ~/"$i" ./
	fi
	ln -vf ./"$i" ~/
done

mkdir -v ~/.RC_backups/
cp -vr ./backups/.* -t ~/.RC_backups/
cp -vr ./backups/* -t ~/.RC_backups/

git add -v .
git commit -v -m "PUSH -- UPDATE_RC.SH `uname -nro`"
git push
