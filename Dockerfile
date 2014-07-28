# DOCKER-VERSION 1.1.1
FROM ubuntu:14.04
MAINTAINER Carl Saturnino <cosaturn@gmail.com>

RUN apt-get update -y

# Env
ENV GO_VERSION go1.2.2

# Install git
RUN apt-get install -q -y build-essential curl git mercurial bzr
RUN curl -k -O https://storage.googleapis.com/golang/$GO_VERSION.linux-amd64.tar.gz
RUN tar -xzf $GO_VERSION.linux-amd64.tar.gz -C /usr/local/
RUN rm $GO_VERSION.linux-amd64.tar.gz
ENV PATH /usr/local/go/bin:/go/bin:$PATH
ENV GOPATH /go

# we're using godep to save / restore dependancies
RUN go get -v github.com/tools/godep

# Coverage
RUN go get -v github.com/axw/gocov/gocov
RUN go get -v github.com/joshuarubin/goveralls

#Removed unnecessary packages
RUN apt-get autoremove -y

# Clear package repository cache
RUN apt-get clean all

