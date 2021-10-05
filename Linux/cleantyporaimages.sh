#!/bin/bash
# auto clean typora images when startup
IMAGESDIRECTORY=~/.config/Typora/typora-user-images
if [ "$(ls -A $IMAGESDIRECTORY)" ];
then
    echo "$IMAGESDIRECTORY is not empty" >> /dev/null
    rm -rf ~/.config/Typora/typora-user-images/*
else
    echo "$IMAGESDIRECTORY is empty" >> /dev/null
fi
