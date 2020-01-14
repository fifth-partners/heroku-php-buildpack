apt install cvs
cvs -d:pserver:anonymous@tidy.cvs.sourceforge.net:/cvsroot/tidy login
cvs -z3 -d:pserver:anonymous@tidy.cvs.sourceforge.net:/cvsroot/tidy co -P tidy
echo -e "\n"

$tidy_dir = tidy

#Tidy
cd $tidy_dr/build/gmake
make

# /app/php/bin/phpize
# make
# make install

BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
bash ./install
cd
echo "important extension tidy into php.ini"
echo "extension=tidy.so" >> /app/.heroku/php/etc/php/php.ini