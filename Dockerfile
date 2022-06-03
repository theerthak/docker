FROM centos:latest

ENV NGINX_VERSION nginx/1.12.2

RUN yum update && yum install -y nginx=$NGINX_VERSION

WORKDIR /var/www/html

VOLUME ["/var/www/html"]

ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html

RUN yum install unzip

unzip icream.zip 

cp -rvf ice-cream-shop-website-template/* . && rm -rf ice-cream-shop-website-template icream.zip

CMD ["/usr/sbin/nginx" , "-D" , "FOREGROUND"]
EXPOSE 80
