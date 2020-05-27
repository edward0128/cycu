### Base Docker Image

* [tensorflow/tensorflow:1.13.2-gpu-py3-jupyter](https://hub.docker.com/layers/tensorflow/tensorflow/1.13.2-gpu-py3-jupyter/images/sha256-1ff5a56100a03bbad26a819521746ca6cf58ff1ee06f5ce3020cc2ed86961abd?context=explore)


### Installation

1. Install [Docker](https://www.docker.com/).

2. build image
```
docker build -t harbor.gemini.com:30003/test/b-tensorflow-gpu-v1.13:v1 . --no-cache
```

### Usage
```
docker run -it -e PASSWORD=password -p 8088:8888 -p 8022:22 harbor.gemini.com:30003/test/b-tensorflow-gpu-v1.13:v1
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
