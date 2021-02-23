


## how to build it


```
docker build . -t "retrace-openssl-tmp"
docker run -it -v $(pwd):/app -v $(pwd)/../openssl:/opt/openssl -v $(pwd)/../libctrace:/opt/libctrace -v $(pwd)/../demo:/opt/demo retrace-openssl-tmp
```
