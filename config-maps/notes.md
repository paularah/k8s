## Important commands 

`kubectl create configmap <config-map-name> --from-literal=<KEY>=<VALUE>`

You can either inject a specific key in the config map or the entire config map as env in the pod. Config can also be mounted in volumes inside the pod 
