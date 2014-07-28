# DOCKER-VERSION 1.1.1
FROM ubuntu:14.04
MAINTAINER Carl Saturnino <cosaturn@gmail.com>

RUN apt-get update -y

# Env
ENV GO_VERSION 1.3.0

# Install git
RUN apt-get install -q -y build-essential curl git mercurial bzr
RUN curl -k -O https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
RUN tar -xzf go$GO_VERSION.linux-amd64.tar.gz -C /usr/local/
RUN rm go$GO_VERSION.linux-amd64.tar.gz
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

