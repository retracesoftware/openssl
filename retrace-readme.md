


## how to build it


```
docker build . -t "retrace-openssl-tmp"
docker run -it -v $(pwd):/app -v $(pwd)/../openssl:/opt/openssl -v $(pwd)/../libctrace:/opt/libctrace -v $(pwd)/../demo:/opt/demo --cpuset-cpus="0-4" retrace-openssl-tmp

./Configure -d
make -j5
```
