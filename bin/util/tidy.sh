 echo "**** install packages ****" && \

 tar xfz tidyhtml-libs-5.4.0-r0.apk -C / && \
 echo "**** configure php-fpm ****" && \
 sed -i 's/;clear_env = no/clear_env = no/g' /etc/php7/php-fpm.d/www.conf && \
 echo "env[PATH] = /usr/local/bin:/usr/bin:/bin" >> /etc/php7/php-fpm.conf && \
 echo "**** fetch bookstack ****" && \
 mkdir -p\
	/var/www/html && \
 if [ -z ${BOOKSTACK_RELEASE+x} ]; then \
	BOOKSTACK_RELEASE=$(curl -sX GET "https://api.github.com/repos/bookstackapp/bookstack/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]'); \
 fi && \
 curl -o \
 /tmp/bookstack.tar.gz -L \
	"https://github.com/BookStackApp/BookStack/archive/${BOOKSTACK_RELEASE}.tar.gz" && \
 tar xf \
 /tmp/bookstack.tar.gz -C \
	/var/www/html/ --strip-components=1 && \
 echo "**** install  composer ****" && \
 cd /tmp && \
 curl -sS https://getcomposer.org/installer | php && \
 mv /tmp/composer.phar /usr/local/bin/composer && \
 echo "**** install composer dependencies ****" && \
 composer install -d /var/www/html/ && \
 echo "**** cleanup ****" && \
 rm -rf \
	/root/.composer \
	/tmp/*