FROM ubuntu:14.04

ADD go-install.sh /

RUN apt-get -q -y update && /go-install.sh && apt-get clean && apt-get purge
ENV GOROOT /usr/lib/golang/golang
ENV PATH $PATH:$GOROOT/bin
