FROM bharath23/debian-x86-stable
RUN apt-get update && apt-get install -y php5 php5-dev php5-cgi php5-fpm nginx libpcre3-dev gcc make php5-mysql
RUN apt-get install -y git
RUN echo "extension=phalcon.so" | tee /etc/php5/mods-available/phalcon.ini
COPY phalcon/ /home/phalcon
WORKDIR /home/phalcon/build
RUN ./install
RUN ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cgi/conf.d/50-phalcon.ini
RUN ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/cli/conf.d/50-phalcon.ini
RUN ln -s /etc/php5/mods-available/phalcon.ini /etc/php5/fpm/conf.d/50-phalcon.ini

