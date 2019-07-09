FROM phpmyadmin/phpmyadmin:4.8
RUN chown -R :0 /var \
 && chmod -R g+rwx /var \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /run \
 && chmod -R g+rwx /run \
 && chown -R :0 /etc/nginx \
 && chmod -R g+rwx /etc/nginx \
 && chown -R :0 /etc/phpmyadmin \
 && chmod -R g+rwx /etc/phpmyadmin

RUN chown :0 /etc/nginx.conf \
 && chmod g+rw /etc/nginx.conf

RUN chown :0 /etc/supervisord.conf \
 && chmod g+rw /etc/supervisord.conf \
 && chown -R :0 /etc/supervisor.d \
 && chmod -R g+rwx /etc/supervisor.d \
 && chown -R :0 /home \
 && chmod -R g+rwx /home \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /sessions \
 && chmod -R g+rwx /sessions

RUN chown :0 /run.sh \
 && chmod g+rwx /run.sh
 
#change port from 80 to 8090
RUN sed -i 's/80 default_server/8090 default_server/g' /etc/nginx/conf.d/default.conf \
 && sed -i 's/listen 80 default_server/listen 8090 default_server/g' /etc/nginx.conf

RUN sed -i 's/pid \/nginx.pid/pid \/home\/nginx.pid/g' /etc/nginx.conf
RUN sed -i 's/;pidfile=\/run\/supervisord.pid/pidfile=\/home\/supervisord.pid/g' /etc/supervisord.conf
RUN sed -i 's/user/#user/g' /etc/supervisor.d/php.ini
RUN sed -i 's/user =/;user =/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/group =/;group =/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/user =/;user =/g' /usr/local/etc/php-fpm.d/www.conf.default
RUN sed -i 's/group =/;group =/g' /usr/local/etc/php-fpm.d/www.conf.default

RUN sed -i 's/chown/#chown/g' /run.sh

ENV HOME /home

USER nobody
ENV PHP_EXTRA_CONFIGURE_ARGS "--enable-fpm --disable-cgi"
CMD ["supervisord", "-n", "-j", "/home/supervisord.pid"]
