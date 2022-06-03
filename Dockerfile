FROM ubuntu:latest

MAINTAINER theertha

RUN apt-get update && apt-get install -y nginx

RUN apt-get install -y unzip

WORKDIR /var/www/html

VOLUME ["/var/www/html"]

ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html

RUN unzip icream.zip

CMD ["/usr/sbin/nginx", "-D", "FOREGROUND"]

EXPOSE 80
