FROM ebittleman/docker-golang:1.4.2

ENV GOPATH /opt/go

ADD main.go $GOPATH/src/code.bittles.net/helloworld/main.go

RUN mkdir -p $GOPATH/bin && mkdir -p $GOPATH/pkg && mkdir -p $GOPATH/src && go get code.bittles.net/helloworld && rm -rf /usr/lib/golang && rm -rf $GOPATH/src $GOPATH/pkg

ENTRYPOINT ["/opt/go/bin/helloworld"]
