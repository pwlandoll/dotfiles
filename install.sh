#!/bin/bash
# Short script for copying dotfiles to where they should go

target=$1
backup_dir=./bak
[ ! -d $backup_dir ] && mkdir $backup_dir

backup_and_move() {
	src=$1
	dest=$2
	perms=$(stat -c "%a" $dest)
	[ -f $dest ] && cp $dest $backup_dir/backup-$(basename $dest)
	cp $src $dest
	eval chmod $perms $dest
}

case $target in
	"ubuntu_bashrc") backup_and_move ubuntu_bashrc $HOME/.bashrc ;;
	*) echo "$target not supported in install script" ;;
esac

