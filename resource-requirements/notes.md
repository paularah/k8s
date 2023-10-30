resource requirements can be either memory, disk, or CPU. By defualt k9s assigns a 0.5 CPU and 256Mi resource requirements to a pod. 
When the CPU usage of pod exceeds the limit, the CPU usage is throttled, on the other hand, when the memory usage of a pod exceeds the limit, the pod is killed with the `OOMKilled` error  i.e out of memory. 
