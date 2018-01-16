FROM jboss/wildfly
RUN chown -R :0 /usr/lib \
 && chmod -R g+rwx /usr/lib \
 && chmod -R o+rx /usr/lib \
 && chown -R :0 /opt/jobss \
 && chmod -R g+rwx /opt/jobss \
 && chmod -R o+rx /opt/jobss
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"[\\\\h \\\\W]\\\\$ \" >> /.bashrc \
 && echo cd /pvc >> /.bashrc
EXPOSE 8080 9990
