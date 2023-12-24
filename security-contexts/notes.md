N/B: capabilities only work at the container level not at the pod level. This wasted my time a bit. 

Container securty context takes precedence over pod security context 

`/usr/linux/capabilities.h` contains all the linux capabilities 

`docker run --priviledged` gives all capabilites to a container. By default docker runs with limited set of capabilities

`docker run --cap-add` to add a priviledge and `--drop-cap` remove priviledge
 
