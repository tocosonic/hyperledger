FROM tobilg/zookeeper-webui
#:x86_64-1.1.0-preview
RUN apk update \
 && apk add ca-certificates wget \
 && mkdir /app/.lein \
 && mkdir /app/.lein/self-installs \
 && export LEIN_HOME=/app/.lein
RUN wget -O /app/.lein/self-installs/leiningen-2.7.1-standalone.jar https://github.com/technomancy/leiningen/releases/download/2.7.1/leiningen-2.7.1-standalone.zip

# && /usr/local/bin/lein self-install
RUN chown -R :0 /app \
 && chmod -R g+w /app
RUN sed -i 's/export.LEIN.HOME.*$/export LEIN_HOME=\"\/app\/.lein\"/' /usr/local/bin/lein
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
EXPOSE 8080
ENV LEIN_ROOT=false
