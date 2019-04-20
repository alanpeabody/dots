#!/bin/bash


echo
echo 'Installing Dots'
echo 'see https://github.com/alanpebody/dots for usage'
echo

pwd=`pwd`
backuptime=`date +%s`

# Symlink one file from source to destination, ask for direction if file exists
SymlinkDotFile() {
  local target=$1
  local destination=$2
  local backup=false
  local delete=false
  local skip=false
  if [ -e $destination ]; then
    echo "$destination exists, you may (s)kip this file, (b)ackup the existing file, or (d)elete the existing file"
    read -p "(s,b,d): " -n 1 option
    echo
    if [ "$option" == "s" ]; then
      skip=true
    fi
    if [ "$option" == "b" ]; then
      backup=true
    fi
    if [ "$option" == "d" ]; then
      delete=true
    fi
  fi

  if [ -h $destination ]; then
    echo "$destination is a symlink, deleting in favor of new symlink"
    delete=true
  fi

  if [ $backup == true ]; then
    back="$destination.back.$backuptime"
    echo "Backing up $destination to $back"
    `mv $destination $back`
  fi

  if [ $delete == true ]; then
    echo "Deleting $destination"
    `rm $destination`
  fi

  if [ ! $skip == true ]; then
    echo "Symlinking $target to $destination"
    `ln -s $target $destination`
  fi
}

read -p "Would you like to configure vim? (y/n): " -n 1 manage_vim
echo

if [ "$manage_vim" == "y" ]; then
  if [ -d "$HOME/.vim" ]; then
    echo "Moving your existing ~/.vim directory to ~/.vim.back.$backuptime"
    mv $HOME/.vim $HOME/.vim.back.$backuptime
  fi

  # Set up dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein.sh
  sh ./dein.sh $HOME/.cache/dein

  for file in `ls $pwd/vim`; do
    SymlinkDotFile "$pwd/vim/$file" "$HOME/.$file"
  done

  echo "Open vim and run :call dein#install() to finish install"
fi

read -p "Would you like to configure zsh? (y/n): " -n 1 manage_zsh
echo

if [ "$manage_zsh" == "y" ]; then
  echo "Too bad, not ready yet. :trollface:"
fi

read -p "Would you like to configure git? (y/n): " -n 1 manage_git
echo

if [ "$manage_git" == "y" ]; then
  echo "Too bad, not ready yet. :trollface:"
fi

read -p "Would you like to configure tmux? (y/n): " -n 1 manage_tmux
echo

if [ "$manage_tmux" == "y" ]; then
  echo "Too bad, not ready yet. :trollface:"
fi


