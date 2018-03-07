FROM hyperledger/fabric-baseimage:x86_64-0.4.2

# ENV PATH=/chaincode/bin
# ENV GOROOT=???
ENV GOPATH=/chaincode/input

RUN mkdir -p /chaincode/input /chaincode/input/src /chaincode/output /chaincode/bin /chaincode/exchange \
 && chown -R :0 /chaincode \
 && chmod -R g+rw /chaincode \
 && chown -R :0 /root \
 && chmod -R g+rw /root

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"[\\\\h \\\\W]\\\\$ \" >> /.bashrc \
 && echo cd /chaincode >> /.bashrc

LABEL org.hyperledger.fabric.version=1.1.0-preview \
      org.hyperledger.fabric.base.version=0.4.2

ADD payload/goshim.tar.bz2 $GOPATH/src/
COPY payload/chaintool payload/protoc-gen-go /usr/local/bin/

VOLUME /chaincode/exchange

# add vars to the deployment configuration
# CORE_CHAINCODE_ID_NAME=mycc7:0.1		request.name:request.version OR CCID.name:CCID.version
# CORE_PEER_TLS_ENABLED=false			ChaincodeSupport.peerTLS
# CORE_CHAINCODE_LOGGING_LEVEL=DEBUG	ChaincodeSupport.chaincodeLogLevel
# CORE_CHAINCODE_LOGGING_SHIM=warning	ChaincodeSupport.shimLogLevel

# build the go chaincode
#  CCBIN		cds.ChaincodeSpec.ChaincoceId.Path
# 		=> see platform.go#56
#  $GOPATH go build -ldflags "-linkmode external -extldflags '-static'" -o /chaincode/bin/chaincode $CCBIN
# copy contents of binpackage.tar to /chaincode/bin (this is the compiled chaincode)
