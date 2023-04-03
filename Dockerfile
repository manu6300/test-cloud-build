FROM python:3.7-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY ./app ./
COPY requirements.txt ./

# Install production dependencies.
RUN pip install -r requirements.txt

# Run the web service on container startup. Here we use the gunicorn 
# webserver, with one worker process and 8 threads. 
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app 


# # FROM centos:7
# # RUN yum update all
# # RUN yum install httpd -y
# # COPY index.html /var/www/html/index.html
# # EXPOSE 80
# # CMD httpd -D FOREGROUND

# FROM centos:7
# RUN yum install httpd -y
# COPY index.html /var/www/html/

# CMD [“/usr/sbin/httpd”,” -D”,” FOREGROUND”]
# EXPOSE 80


# # FROM centos:7
# # RUN yum update all
# # RUN yum install httpd -y
# # COPY index.html /var/www/html/index.html
# # EXPOSE 80
# # CMD httpd -D FOREGROUND
