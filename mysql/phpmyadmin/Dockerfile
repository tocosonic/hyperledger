FROM phpmyadmin/phpmyadmin
RUN chown -R :0 /var \
 && chmod -R g+rwx /var \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /run \
 && chmod -R g+rwx /run

RUN chown :0 /etc/php-fpm.conf \
 && chmod g+rw /etc/php-fpm.conf \
 && chown :0 /etc/nginx.conf \
 && chmod g+rw /etc/nginx.conf
