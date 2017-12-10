FROM tobilg/zookeeper-webui
#:x86_64-1.1.0-preview
RUN mkdir /app/.lein \
 && export LEIN_HOME=/app/.lein \
 && /usr/local/bin/lein self-install
RUN chown -R :0 /app \
 && chmod -R g+w /app \
 && chown -R :0 /etc/leinrc \
 && chmod -R g+w /etc/leinrc
EXPOSE 8080
ENV LEIN_ROOT=false
