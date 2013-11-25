FROM ubuntu:12.04
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>

#FIX prevent apt from starting nginx right after the installation
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d
#FIX END

RUN apt-get -qy install python-software-properties software-properties-common
RUN add-apt-repository ppa:nginx/stable
RUN apt-get update
RUN apt-get -qy install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#FIX allow autostart again
RUN rm /usr/sbin/policy-rc.d
#FIX END

#EXPOSE
#ENTRYPOINT [""]
#CMD [""]
