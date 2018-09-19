FROM swaggerapi/swagger-ui:v3.19.0

RUN chown -R :0 /etc/nginx/ \
 && chown -R :0 /usr/lib/nginx/ \
 && chown -R :0 /usr/share/nginx/ \
 && chown -R :0 /var/log \
 && chmod -R g+rwx /etc/nginx/ \
 && chmod -R g+rwx /usr/lib/nginx/ \
 && chmod -R g+rwx /usr/share/nginx/ \
 && chmod -R g+rwx /var/log
