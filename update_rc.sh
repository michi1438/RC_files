#!/bin/bash
#
#UPDATE_RC.SH_________________

git add -v .
git commit -v -m "PULL -- UPDATE_RC.SH `uname -nro`"
git pull --no-rebase
declare -a arr=(".config/qutebrowser/config.py" ".bashrc" ".lynxrc" ".xpdfrc" ".vimrc" ".bash_profile" ".gdbinit" ".vim_clang_tidy_config" ".vim")

if [ ! -d "./backups/" ]; then
	mkdir ./backups/
fi

for i in "${arr[@]}"
do
	IS_DIFF=$(diff -nr ./"$i" ~/"$i")
	if [ ! -z "$IS_DIFF" ] ; then
		date >> ./backups/"$i".diff
		uname -nro >> ./backups/"$i".diff
		echo ${IS_DIFF} >> ./backups/"$i".diff
	fi
	if [ ! -e  "$i" ]
	then
		cp -vr  ~/"$i" ./
	fi
	ln -vf ./"$i" ~/
done

cp -vr ./backups/* -t ~/.RC_backups/

git add -v .
git commit -v -m "PUSH -- UPDATE_RC.SH `uname -nro`"
git push
