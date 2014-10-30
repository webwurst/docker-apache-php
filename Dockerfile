#FROM buildpack-deps:jessie
#FROM ubuntu:14.04
FROM ubuntu:14.10
ENV DEBIAN_FRONTEND noninteractive

# apache2.4 with php5
RUN apt-get update && apt-get install -y --no-install-recommends \
	  libapache2-mod-php5 \
		php5-apcu \
		php5-gd \
		php5-json \
		php5-intl \
		php5-sqlite \
		php5-curl \
		php5-mysql \
		php5-pgsql \
		php5-mcrypt \
		php5-imagick \
		php5-xsl \
		php-xml-parser \
	&& rm -rf /var/www/html \
  && mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html \
	&& chown -R www-data:www-data /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html

# config
COPY apache2.conf /etc/apache2/

WORKDIR /var/www/html
EXPOSE 80
CMD ["apache2", "-DFOREGROUND"]
