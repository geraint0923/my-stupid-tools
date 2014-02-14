#!/bin/bash

./configure --prefix=$HOME/.usr --enable-rubyinterp=yes --enable-pythoninterp=yes \
    --enable-perlinterp=yes --enable-cscope=yes --enable-luainterp=yes \
    --with-features=huge \
    --with-python-config-dir=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config
