FROM alexcheng/apache2-php7:7.1.11

MAINTAINER Fu Cheng <alexcheng1982@gmail.com>


RUN cd /var/www/html \
    && find . -type d -exec chmod 770 {} \; \
    && find . -type f -exec chmod 660 {} \; \
    && chmod u+x bin/magento