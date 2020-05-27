
### Base Docker Image

* [ubuntu:16.04](https://hub.docker.com/layers/ubuntu/library/ubuntu/16.04/images/sha256-a4fc0c40360ff2224db3a483e5d80e9164fe3fdce2a8439d2686270643974632?context=explore)


### Installation

1. Install [Docker](https://www.docker.com/).

2. build image
```
docker build -t harbor.gemini.com:30003/test/e-v4.7.12:v1 . --no-cache
```

### Usage
```
docker run -it -e PASSWORD=password -p 8022:22 harbor.gemini.com:30003/test/e-v4.7.12:v1
```    
    
### Test
You can use the "password" to login JupyterNoteBook.
```
    
 1. use ssh to connect the pods
```
ssh root@IP -p 8022
```
