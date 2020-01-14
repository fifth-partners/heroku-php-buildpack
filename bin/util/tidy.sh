#!/bin/bash
# Build Path: /app/.heroku/php/
tidy_dir=tidy
ls

#Tidy
cd $tidy_dir/build/gmake
make

BUILD_DIR=$1
export PATH=$tidy_dir/bin:$PATH
echo $PATH

pecl install tidy
# /app/php/bin/phpize
# make
# make install