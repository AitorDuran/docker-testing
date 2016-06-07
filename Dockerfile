FROM ubuntu:latest
MAINTAINER Aitor Duran <aitorduranmonge@gmail.com>

# Instalacion de dependencias apache + php7 + modulo de apache con php ... 

RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 libapache2-mod-php7.0 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur && apt-get clean

# Configurar los modulos de apache con php.

RUN a2enmod php7.0
RUN a2enmod rewrite

# Modificar el fichero php.ini

RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Exposicion de apache en el puerto 80.

EXPOSE 80

# Copiar el repositorio al contenedor de apache.

ADD html /var/www/app

# Añadir y actualizar el fichero de virtualhost.

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Correr apache en segundo plano

CMD /usr/sbin/apache2ctl -D FOREGROUND
