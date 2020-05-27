
### Base Docker Image

* [tensorflow/tensorflow:1.14.0-gpu-py3-jupyter](https://hub.docker.com/layers/tensorflow/tensorflow/1.14.0-gpu-py3-jupyter/images/sha256-a55c6041a788e4ca58304d8f850fa5cd70f99e1c37228bba8794e8b6a9c45ac1?context=explore)


### Installation

1. Install [Docker](https://www.docker.com/).

2. build image
```
docker build -t harbor.gemini.com:30003/test/f-pycharm:v1 . --no-cache
```

### Usage
```
docker run -it -e PASSWORD=password -p 8022:22 harbor.gemini.com:30003/test/f-pycharm:v1 
```    
    
### Test    
 1. use ssh to connect the pods
```
ssh root@IP -p 8022
```
