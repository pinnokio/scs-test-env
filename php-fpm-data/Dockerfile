FROM pinnokio/php-fpm:base
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>
RUN mkdir -p /var/www
ADD laravel/scs-data /var/www
ADD start /
RUN chmod +x /start
CMD ["/start"]
