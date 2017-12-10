FROM tobilg/zookeeper-webui
#:x86_64-1.1.0-preview
RUN apk update \
 && apk add ca-certificates wget \
 && mkdir /app/.lein \
 && export LEIN_HOME=/app/.lein
RUN wget -O /app/.lein/self-installs/leiningen-2.7.1-standalone.jar https://github.com/technomancy/leiningen/releases/download/2.7.1/leiningen-2.7.1-standalone.zip

# && /usr/local/bin/lein self-install
RUN chown -R :0 /app \
 && chmod -R g+w /app \
 && chown -R :0 /etc/leinrc \
 && chmod -R g+w /etc/leinrc
RUN sed -i sed -i 's/export.LEIN.*$/export LEIN_HOME=\"\/app\/.lein\"/g' /usr/local/bin/lein
EXPOSE 8080
ENV LEIN_ROOT=false
