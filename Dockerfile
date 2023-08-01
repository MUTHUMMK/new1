FROM ubuntu
LABEL Name = "muthu"
RUN apt-get update
RUN apt install apache2 -y
COPY index.html /var/www/html/index.html
CMD ["bash"]
EXPOSE 80
