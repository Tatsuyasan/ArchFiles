#!/bin/sh
cat pkglist.env | xargs paru -S --needed --noconfirm
