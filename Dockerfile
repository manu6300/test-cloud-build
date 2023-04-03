FROM ubuntu 
RUN apt update 
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt clean 
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD [“apache2ctl”, “-D”, “FOREGROUND”]


# FROM centos:7
# RUN yum update all
# RUN yum install httpd -y
# COPY index.html /var/www/html/index.html
# EXPOSE 80
# CMD httpd -D FOREGROUND
