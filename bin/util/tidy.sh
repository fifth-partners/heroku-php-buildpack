#!/bin/bash
# Build Path: /app/.heroku/php/
tidy_dir=tidy
ls

#Tidy
cd $tidy_dir/build/gmake
make

# /app/php/bin/phpize
# make
# make install