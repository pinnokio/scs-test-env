FROM ubuntu:12.04
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get -qy install php5-curl php5-fpm php5-mcrypt php5-suhosin php5-pgsql
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e :"s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
EXPOSE 9000
ADD start /
RUN chmod +x /start
CMD ["/start"]
