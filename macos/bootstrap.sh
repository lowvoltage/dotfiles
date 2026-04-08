#!/usr/bin/env bash

# Based on:
# https://gist.github.com/huevos-y-bacon/85f0832104dbfebdd705aa9d04cbd302

colours(){
  reset=$(tput sgr0 :-"" 2>/dev/null); export reset
  bold=$(tput bold :-"" 2>/dev/null) ; export bold
  R=$(tput setaf 1 :-"" 2>/dev/null) ; export R
  G=$(tput setaf 2 :-"" 2>/dev/null) ; export G
  B=$(tput setaf 4 :-"" 2>/dev/null) ; export B
  Y=$(tput setaf 3 :-"" 2>/dev/null) ; export Y
}; colours

# INSTALL HOMEBREW - REQUIRES PASSWORD
install_homebrew(){
  echo -e "${bold}${Y}Installing Homebrew ...${reset}"
  which -s brew
  if [[ $? != 0 ]] ; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo
  else
    echo -e "${bold}${Y}Homebrew already installed, running \`brew update\`...${reset}"
    brew update
  fi
}

install_homebrew
# download Brewfile from my own repo
# install Brewfile
