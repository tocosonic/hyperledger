FROM nginx:1.19.2

RUN apt-get -y --allow-unauthenticated update
RUN apt-get -y --allow-unauthenticated upgrade

RUN apt-get -y --allow-unauthenticated install rsync \
 && apt-get -y --allow-unauthenticated install procps \
 && apt-get -y --allow-unauthenticated install nano \
 && apt-get -y --allow-unauthenticated install joe \
 && apt-get -y --allow-unauthenticated install less\
 && apt-get -y --allow-unauthenticated install p7zip-full \
 && apt-get -y --allow-unauthenticated install telnet \
 && apt-get -y --allow-unauthenticated install apache2-utils
 
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
#RUN echo 'try_files $uri $uri/ /index.html' >> /etc/nginx/nginx.conf
#RUN cat /etc/nginx/nginx.conf

RUN cp -r /usr/share/nginx/html/* /www/

#create reverse proxy configuration for prometheus
COPY payload/nginx-prometheus-proxy.conf /etc/nginx/

EXPOSE 8080

VOLUME /www
