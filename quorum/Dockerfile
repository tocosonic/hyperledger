FROM golang:1.11-alpine as builder
# Add a user to run this server; the user belongs to group root (like on OpenShift)

WORKDIR /usr/src/app
ENV PATH=/usr/src/app/quorum/build/bin:$PATH

# Building quorum
RUN apk add --no-cache make gcc musl-dev linux-headers git
RUN git clone https://github.com/jpmorganchase/quorum.git
RUN cd quorum && make all

# Update access rights
RUN chown -R :0 /usr/src/app/quorum
RUN chmod -R g+rwx /usr/src/app/quorum
