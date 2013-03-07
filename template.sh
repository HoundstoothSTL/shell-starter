#!/bin/bash
# Author: Rob Bennet
# Company: Houndstooth
# Github: https://github.com/HoundstoothSTL 
# Description: Starter Bash Script Template

# Display usage if no parameters given
if [[ -z "$@" ]]; then
  echo " ${0##*/} <input> - description"
  exit
fi

# Required program(s)
req_progs=(prog1 prog2)
for p in ${req_progs[@]}; do
  hash "$p" 2>&- || \
  { echo >&2 " Required program \"$p\" not installed."; exit 1; }
done

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)             # Reset
info=${bldwht}*${txtrst}        # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

# Indicator usage
echo -e "${info} "
echo -e "${pass} "
echo -e "${warn} "
 
# Check if root
if [ $(whoami) != root ]; then
  echo " Must be root to use.  You'll need sudo."
  exit
fi
 
# Check if selection exists
if [ ! -e "$@" ]; then
  echo " Selection \""$@"\" does not exist."
  exit
fi