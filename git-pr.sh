#!/bin/bash

# Installation and usage:
# See README at https://github.com/mkilmanas/git-pr/blob/master/README.md

REPOSITORY=`git remote -v | grep -oE --max-count=1 '[^:]+/[^.]+'`
SOURCE=`git rev-parse --abbrev-ref HEAD`
TARGET=$1

if echo -e foo | grep -v '^-e' > /dev/null
then
    ECHO_FLAG='-e'
fi

if [ "$TARGET" = "--help" ] || [ "$TARGET" = "-h" ]; then
    echo $ECHO_FLAG "Usage: git pr [<branch>]"
    echo $ECHO_FLAG "See https://github.com/mkilmanas/git-pr/blob/master/README.md for more details"
    echo ""
    exit 1
fi

if [ -z $TARGET ]; then
    TARGET=`git config --get pr.default-branch`
fi

if [ -z $TARGET ]; then
    echo $ECHO_FLAG "\033[0;31mNo branch specified to create the pull request against"
    echo $ECHO_FLAG "You need to either specify it as a parameter, e.g.:"
    echo $ECHO_FLAG "    \033[0;32mgit pr master\033[0;31m"
    echo $ECHO_FLAG "Or you can set it as pr.default-branch in git config:"
    echo $ECHO_FLAG "    \033[0;32mgit config --add [--global] pr.default-branch master\033[0;31m"
    echo $ECHO_FLAG "\033[0m"
    exit 1;
fi

URL_FORMAT="https://github.com/%s/compare/%s...%s"
URL=$(printf $URL_FORMAT $REPOSITORY $TARGET $SOURCE)

echo $ECHO_FLAG "\033[0;33m"$URL"\033[0m"

if which x-www-browser > /dev/null
then
  x-www-browser $URL
elif which gnome-open > /dev/null
then
  gnome-open $URL
elif which xdg-open > /dev/null
then
  xdg-open $URL
else
  open $URL
fi
