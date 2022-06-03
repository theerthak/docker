FROM ubuntu:latest

MAINTAINER theertha

RUN apt-get update && apt-get install -y nginx

RUN apt-get install -y unzip

WORKDIR /var/www/html

ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip .

RUN cd /var/www/html

RUN unzip icream.zip 

RUN cp -rvf ice-cream-shop-website-template/* . && rm -rf ice-cream-shop-website-template icream.zip


CMD ["/bin/sh"]

VOLUME ["/var/www/html"]

EXPOSE 80
