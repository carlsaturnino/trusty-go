# DOCKER-VERSION 1.1.1
FROM ubuntu:14.04
MAINTAINER Carl Saturnino <cosaturn@gmail.com>

RUN apt-get update -q

# Install git
RUN apt-get install -qy build-essential curl git mercurial bzr
RUN curl -k -O https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz
RUN tar -xzf go1.2.2.linux-amd64.tar.gz -C /usr/local/
RUN rm go1.2.2.linux-amd64.tar.gz
ENV PATH /usr/local/go/bin:/go/bin:$PATH
ENV GOPATH /go

# we're using godep to save / restore dependancies
RUN go get -v github.com/kr/godep

# Coverage
RUN go get -v github.com/axw/gocov/gocov
RUN go get -v github.com/joshuarubin/goveralls

