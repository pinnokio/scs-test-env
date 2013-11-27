FROM pinnokio/php-fpm:base
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get -qy install php5-curl php5-fpm php5-mcrypt php5-suhosin php5-pgsql
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN mkdir -p /var/www
ADD laravel/scs-auth /var/www
ADD start /
RUN chmod +x /start
CMD ["/start"]
