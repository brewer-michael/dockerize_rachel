FROM php:7-apache

MAINTAINER brewermichael <design@brewerwebdesign.com>

RUN mkdir /var/www/public
RUN apt-get update && apt-get --assume-yes upgrade
RUN apt-get --assume-yes install sqlite python3 python3-pip

RUN pip3 install stem

#Install git
RUN docker-php-ext-install pdo pdo_mysql mysqli
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

COPY src /var/www/html
RUN chown -R www-data:www-data /var/www
#RUN rm /var/www/html/index.html

#CMD ["start-apache"]
#CMD ["apache2-foreground"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
