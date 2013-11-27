FROM pinnokio/php-fpm:base
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>
RUN mkdir -p /var/www
ADD laravel/scs-auth /var/www
ADD start /
RUN chmod +x /start
CMD ["/start"]
