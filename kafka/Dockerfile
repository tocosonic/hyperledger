FROM hyperledger/fabric-kafka:x86_64-1.1.0-preview
RUN chown -R :0 /opt/kafka/ \
 && chmod -R g+rwx /opt/kafka/
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
