
### Base Docker Image

* [tensorflow/tensorflow:1.10.1-devel-gpu-py3](https://hub.docker.com/layers/tensorflow/tensorflow/1.10.1-devel-gpu-py3/images/sha256-f0ef7657d2ce354d30ae539cf54d5433d85021b86c9f7de545d905e588d691f6?context=explore)


### Installation

1. Install [Docker](https://www.docker.com/).

2. build image
```
docker build -t harbor.gemini.com:30003/test/c-tensorflow-gpu-v1.10.1 . --no-cache
```

### Usage
```
docker run -it -e PASSWORD=password -p 8088:8888 -p 8022:22 harbor.gemini.com:30003/test/c-tensorflow-gpu-v1.10.1
```    
    
### Test
    
 1. use browser connect the website
 
```
IP:8088

You can use the "password" to login JupyterNoteBook.
```
    
 2. use ssh to connect the pods
```
ssh root@IP -p 8022
```
