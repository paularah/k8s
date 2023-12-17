since roles and role bindings are namepaced, cluster wide resources like nodes and persistent volumes cannot be used for them. Cluster roles allows us do this. Addionally, cluster roles are creating authorization on  namespaced k8s objects cluster wide without being pined to a specific nampeaced.  

Basically when you create a cluster role for a namsepaced resource like pod, the resources becomes available cluster wide. 
