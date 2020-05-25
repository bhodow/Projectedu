FROM devopsedu/webapp
  
RUN apt update -y && apt upgrade -y
RUN apt install -y apache2 curl git

WORKDIR /var/www/html

RUN git clone https://github.com/pbeniwal/ProjectEdureka.git

RUN mv ProjectEdureka/* . && rm -fr ProjectEdureka/ && mv apache2.conf /etc/apache2/apache2.conf

ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
