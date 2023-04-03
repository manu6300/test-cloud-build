FROM centos
RUN yum install httpd -y
COPY index.html /var/www/html/

CMD [“/usr/sbin/httpd”,” -D”,” FOREGROUND”]
EXPOSE 80


# FROM centos:7
# RUN yum update all
# RUN yum install httpd -y
# COPY index.html /var/www/html/index.html
# EXPOSE 80
# CMD httpd -D FOREGROUND
