FROM phpmyadmin/phpmyadmin
RUN chown -R :0 /var \
 && chmod -R g+rwx /var \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /run \
 && chmod -R g+rwx /run \
 && chown -R :0 /etc/nginx \
 && chmod -R g+rwx /etc/nginx


RUN chown :0 /etc/php-fpm.conf \
 && chmod g+rw /etc/php-fpm.conf \
 && chown :0 /etc/nginx.conf \
 && chmod g+rw /etc/nginx.conf

#change port from 80 to 8090
RUN sed -i 's/80 default_server/8090 default_server/g' /etc/nginx/conf.d/default.conf \
 && sed -i 's/listen 80 default_server/listen 8090 default_server/g' /etc/nginx.conf
