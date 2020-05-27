How to use pycharm to connect the remote server.
- https://medium.com/@matteosoo/how-to-configure-pycharm-with-remote-interpreter-23f6a568fc28

### Base Docker Image

* [tensorflow/tensorflow:2.0.0-gpu-py3-jupyter](https://hub.docker.com/layers/tensorflow/tensorflow/2.0.0-gpu-py3-jupyter/images/sha256-613cdca993785f7c41c744942871fc5358bc0110f6f5cb5b00a4b459356d55e4?context=explore)


### Installation

1. Install [Docker](https://www.docker.com/).

2. build image
```
docker build -t harbor.gemini.com:30003/test/harbor.gemini.com:30003/test/a-tensorflow-gpu-v2.0.0:v1 . --no-cache
```

### Usage
```
docker run -it -e PASSWORD=password -p 8088:8888 -p 8022:22 harbor.gemini.com:30003/test/harbor.gemini.com:30003/test/a-tensorflow-gpu-v2.0.0:v1
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
