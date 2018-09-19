FROM:swaggerapi/swagger-editor:v3.6.11

RUN chown -R :0 /etc/nginx/ \
 && chown -R :0 /usr/lib/nginx/ \
 && chown -R :0 /usr/share/nginx/ \
 && chown -R :0 /var/log \
 && chmod -R g+rwx /etc/nginx/ \
 && chmod -R g+rwx /usr/lib/nginx/ \
 && chmod -R g+rwx /usr/share/nginx/ \
 && chmod -R g+rwx /var/log

#change listening port to port 8081
RUN sed -i 's/8080/8081/g' /etc/nginx/nginx.conf
