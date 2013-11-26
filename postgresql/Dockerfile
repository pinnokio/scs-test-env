FROM ubuntu:12.04
MAINTAINER Konstantin Lazarenko <pinnokio@gmail.com>

#FIX prevent apt from starting postgres right after installation
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d
#FIX END

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update
RUN apt-get -qy install wget sudo rsync openssh-server
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
RUN apt-get -q update

#FIX https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/813398
RUN apt-get -qy install language-pack-en 
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
#FIX END

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-9.3 postgresql-contrib-9.3

#FIX allow autostart again
RUN rm /usr/sbin/policy-rc.d
#FIX END

#EXPOSE
#ENTRYPOINT ["/bin/su"]
ADD .ssh /tmp

ADD start /
RUN chmod +x /start

CMD ["/start"]
