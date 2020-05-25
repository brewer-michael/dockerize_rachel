FROM php:7-apache

MAINTAINER brewermichael <design@brewerwebdesign.com>

#If copying files from local folder
#RUN mkdir /var/www/public
RUN apt-get update && apt-get --assume-yes upgrade
RUN apt-get --assume-yes install sqlite python3 python3-pip git

RUN pip3 install stem

#Install docker mysql extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

#Copy local files
#RUN copy src /var/www/html
RUN  git clone https://github.com/worldpossible/contentshell.git /var/www/html/rachel
RUN chown -R www-data:www-data /var/www

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
