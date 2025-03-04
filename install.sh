#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

function symlink() {
  local src=${1};
  local filename="$(basename ${1})"

  ln -s "${src}" "${HOME}/.${filename}";
}

function install_tmux() {
  symlink "${HOME}/.config/tmux" 
  symlink "${HOME}/.config/tmux.conf" 
}

function install_vale() {
  symlink "${HOME}/.config/vale.ini" 
}

function install_git() {
  symlink "${HOME}/.config/git/gitconfig"
}

function install_hammerspoon() {
  symlink "${HOME}/.config/hammerspoon"
}

function main() {
  install_git(); 
  install_tmux();

  if [ "$(uname)" == "Darwin" ]; then
    install_vale();
    install_hammerspoon();
  fi
}
