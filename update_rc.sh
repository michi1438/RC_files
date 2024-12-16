#!/bin/bash
#
#UPDATE_RC.SH_________________

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

msg_head=$(echo $0 | awk '{ print toupper($0) }')

function finish {
	echo
	printf "${RED}${msg_head//PART3\//} something has failed and the \
the script has been interupted...${NC}\n"
}
trap finish ERR

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes#

git add -v .
git commit -v -m "PULL -- UPDATE_RC.SH `uname -nro`" || true
git pull --no-rebase
declare -a arr=(".config/qutebrowser/config.py" ".config/sway/config" \
	".bashrc" ".lynxrc" ".xpdfrc" ".vimrc" ".bash_profile" ".gdbinit" \
	".vim_clang_tidy_config")

if [ ! -d "./backups/" ]; then
	mkdir ./backups/
fi


if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo bla

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

mkdir ~/.RC_backups/ || true
cp -r ./backups/.* -t ~/.RC_backups/ || true
cp -r ./backups/* -t ~/.RC_backups/ || true

git add -v .
git commit -v -m "PUSH -- UPDATE_RC.SH `uname -nro`" || true
git push
