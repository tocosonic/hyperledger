FROM nginx:1.14

RUN apt-get -y --allow-unauthenticated update
RUN apt-get -y --allow-unauthenticated upgrade

RUN apt-get -y --allow-unauthenticated install rsync \
 && apt-get -y --allow-unauthenticated install nano \
 && apt-get -y --allow-unauthenticated install joe \
 && apt-get -y --allow-unauthenticated install less\
 && apt-get -y --allow-unauthenticated install p7zip-full \
 && apt-get -y --allow-unauthenticated install telnet

RUN mkdir -p /www \
 && chown -R :0 /www \
 && chmod -R g+rwx /www \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /etc/nginx \
 && chmod -R g+rwx /etc/nginx \
 && chown -R :0 /var \
 && chmod -R g+rwx /var
RUN chown -R :0 /run \
 && chmod -R g+rwx /run
 
RUN sed -i 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf
RUN sed -i 's/root\(.*\).usr.share.nginx.html/root \/www/' /etc/nginx/conf.d/default.conf
RUN sed -i 's/^user/#user/' /etc/nginx/nginx.conf

COPY payload/default.conf /etc/nginx/conf.d/

#RUN cat /etc/nginx/nginx.conf

RUN cp -r /usr/share/nginx/html/* /www/

EXPOSE 8080

VOLUME /www
