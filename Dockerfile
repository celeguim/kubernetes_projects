FROM rockylinux:9
LABEL Author="luiz.celeguim@gmail.com"
RUN yum install -y httpd wget unzip
WORKDIR /var/www/html/
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
