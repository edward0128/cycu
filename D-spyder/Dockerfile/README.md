## Ubuntu Dockerfile


This repository contains **Dockerfile** of [Ubuntu](http://www.ubuntu.com/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/ubuntu/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [debian:stretch-slim](https://hub.docker.com/layers/debian/library/debian/stretch-slim/images/sha256-36dc4486ba221b94c0bd4d084f506b176978e0cd549f965fc8986eefa998d14d)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/ubuntu/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull debian:stretch-slim`

   (alternatively, you can build an image from Dockerfile: `docker build -t harbor.gemini.com:30003/test/nginx3 .`)


### Usage

    docker run -it -p 8080:80 -p 8022:22 harbor.gemini.com:30003/test/nginx3

### Test
    
 1. use browser connect the website
 
```
IP:8088
```
    
 2. use ssh to connect the pods
```
ssh root@IP -p 8022
```