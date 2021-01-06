FROM ubuntu:latest

MAINTAINER orangethakkali

#COPY ./index.html /usr/share/nginx/html/index.html

#COPY ./webdav.conf /etc/nginx/conf.d/default.conf

#COPY ./.credentials.list /etc/nginx/.credentials.list
RUN apt update

RUN apt-get install -y nano \
                   wget \
                   dialog \
                   net-tools vim  

RUN apt install -y apt-utils

RUN apt install -y nginx-full
#	ln -sf /dev/stdout /var/log/nginx/access.log \#
#	&& ln -sf /dev/stderr /var/log/nginx/error.log \

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN echo "include /etc/nginx/modules-enabled/*.conf;" >> /etc/nginx/nginx.conf

COPY ./webdav.conf /etc/nginx/sites-available/default
COPY ./.credentials.list /etc/nginx/.credentials.list

RUN mkdir -p /tmp/nginx/client-bodies

RUN mkdir -p /var/dav/webdav_root
RUN chown -R www-data:www-data /var/dav/
#RUN rm /etc/nginx/sites-enabled/default

EXPOSE 80

STOPSIGNAL SIGQUIT

#CMD ["nginx", "-g", "daemon off;"]
CMD ["service", "nginx", "start"]
