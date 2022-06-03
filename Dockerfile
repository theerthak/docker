FROM centos:latest

MAINTAINER theertha

RUN cd /etc/yum.repos.d/

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update && yum install -y nginx

WORKDIR /var/www/html

VOLUME ["/var/www/html"]

ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html

RUN yum update && yum install unzip

unzip icream.zip 

cp -rvf ice-cream-shop-website-template/* . && rm -rf ice-cream-shop-website-template icream.zip

CMD ["/usr/sbin/nginx", "-D", "FOREGROUND"]

EXPOSE 80
