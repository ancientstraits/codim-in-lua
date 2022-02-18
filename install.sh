#!/bin/sh
INSTALLDIR='/usr/local/share/lua/5.1/codim'
mkdir -p $INSTALLDIR
cp -r codim/*.lua $INSTALLDIR
chmod 755 $INSTALLDIR
install -m755 codim.lua /usr/local/bin/codim