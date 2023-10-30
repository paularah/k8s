# My Kubernetes Learning Notes
## cluster-roles
since roles and role bindings are namepaced, cluster wide resources like nodes and persistent volumes cannot be used for them. Cluster roles allows us do this. Addionally, cluster roles are creating authorization on  namespaced k8s objects cluster wide without being pined to a specific nampeaced.  


## commands-and-args
commmand field in the po defintion corresponds to entrypoint field in docker and while args field corresponds to the CMD field in docker 


## config-maps
## Importat commands 


`kubectl create configmap app-config --from-literal=<KEY>=<VALUE>`

envFrom in the corresponding pod defintion file is an array field, this makes sense be cuase you can specify muktile config maps in a pod. `:wq



## container-logging
`kubectl logs -f <pod-name>` the -f flag stream the logs the STDIN just like docker -it does. 


## ingress
A good way to think of ingress controllers is to think of them as eessentialy a layer 7 proxy baked into k8s. Ingress controllers are deployed via a deployment, configuration is placed in a config map and a service account with the right authorization is created too. A service to expose the deployment on stnadard port 80 and 443 is also created. Afterwrds, the ingress resources that specifies the rule on how traffic is directed to the cluster is also created. This together forms a simple ingress deployment. 

N/B: The port on the ingress rule actually points to service port not the ingress controller port


## jobs-cronjobs
Jobs create pods underneath to execute and complete a task and are quite different from pods created by repica sets becuase by default a restart policy of alwas tries to ensure a pod  is always alive. completions indicate the number of succesful executions that equates a completed job. N/B: A cronjob has 3 spec -> cronjob spec -> job spec and pod spec  


## kubeconfig
kube config fle that configure the cluster and its authentication and authorization config i typically located in `$HOME/.kube/config` directory. Users, clusters and contexts are listed in the kubeconfig file. A context associates a user with a cluster. 

Authorization basically happen in 4 mains ways. RBAC, ABAC, webhooks and Node. 
k8s internally uses the Node access control for kubelet to asses the cluster. webhooks relies on an external proivder to validate authorization mechannisms. ABAC relies on JSON files specificy the access control while  RBAC relies on role and role bindings 


## limit-range
While you can use resource requirement to specify how much compute a pod can use, limit ranges allow you specify default values for every object created. Limit ranges only affect existing objects not newly created ones. 



## liveness-readiness-probe
liveness probes ensure that a container is healthy, when a conatiner fails the liveness probe test, it is restarted. On the other hand readiness probe ensure that a container is ready to start recieving request. As a general rule of thumb, you have 3 ways to test for livveness and readness. Via an httpRequest, via tcp socket or executing a command. 


## network-polices
There is no imperative wya to create nwtwork policies. So all rulesets will have to be created by hand. There two type of network polices. Ingress and Egress. The reuleset can either be by podselectors, namespace selector or Ip range(CIDR)


## node-affinity
unlike taints and tolerations, node affinity works by placing labels on the node and selectors on the pods with operators to write more complex rulesets. 

steps 

edit the node and place labels on te node and modify the pod definition to write the rules sets on how the pods gets placed on the node. 

## Importants operators 

In, NotIn, Exists, DoesNotExist

## Important Ruleset 
The rulesets here uses the affinity/ant-affinity language 

`requiredDuringSchedulingIgnoredDuringExecution` means that a pod is only scheduled on a node when the rule sets applies `preferredDuringSchedulingIgnoredDuringExecution` is the opposite. This only affects scheduling. existing pods are ignored.



## node-selectors
node selectors ensure a specific pod is placed on a specific node using labels and selector. Node are labels and pod created to match this label

## Important Commands

`k label nodes <node-name> <key>=<value>`


## observability
enable metrics server on minikube or clone and apply the metrics server on any other cluster type. `kubectl top node` displays basic metrics about a node. For more advanced usage you will have to settle for something oile promotheus. `kubectl top pod` displays the metrics for the individual pod. 


## persistent-volume-claims
Persistent volumes essentially removes the need to configure a storage solution like a volume for every user in the clutster. A persistent volume is confgured once and users creating pods and deployment can make a claim to it. A persistent volume claim is essentially a claim to a persistent volume :) Th pod can then be configured to use the persistent volume claim as volume  bad analogy but yeah. Btw both object can only be created delaratively, so dont try creating them impertavely.storage class are a way dynamically provision persistent volumes. When a claim is made to a volume, the storgae clas creates the peristent volume under the hood on the fly.  


## resource-qouta
limits computes resources by namespaces. 


## resource-requirements
resource requirements can be either memory, disk, or CPU. By defualt k9s assigns a 0.5 CPU and 256Mi resource requirements to a pod. A pod is killed is its exceeds its resource reuirements. 


## scheduling
The scheduler places pod on the nodes. This is based on scheduling algorithm the scheduler uses. THe scheduler is a pod in the `kube-system` namespace. Typically when a pod is created, the scheduler attaches the pod to a node with `nodeName` property. You can add the node's name here if you want to manually scheule a pod. When you inspect the live pod and the nodeName property is missing, this most likely points to an issue with the scheduler. 

## secrets
You can create secret imperatively by `k create secret generic <secret name> --from-literal`

## important commands

base64 encode a string using the in built linux utility 

`echo -n <some-string> | base64`


## security-contexts
N/B: capabilities only work at the container level not at the pod level. This wasted my time a bit. 

Container securty context takes precedence over pod security context 

`/usr/linux/capabilities.h` contains all the linux capability

`docker run --priviledged gives all capabilites to a container. By default docker runs with limited set of capabilities
 


## service-account
user accounts are for humans and service account for apps. A default service account is created with limited permisions. A secret is creaetd with a JWT token i it which can then be used to authenticate against the k8s API. A volume is also mounted in the pods `var/run/secrets` so pods can access the secrets internally


## taints-tolerations
Taints are applied on nodes and work like a some sort  of default-deny model. When a taint is applied on node, no pod can be scheduled on that node until a toleration for that node is applied on the pod.

N/B: note that taints & tolerations do not guarantee a specific pod is placed on a node. For example a pod with a toleration could still end up being placed on a node without a taint. 

There are 3 taint effects `NoSchedule | PreferNoSchedule | NoExecute` 

* No schedule taint effect ensure no new pods are placed on the node that don't have the corresponding tolerations but it has no effect on already existing pods 
* No execute evicts non-complaints pods from the nodes 
* PreferNoSchedule tries not placed non compliant pods on the node. 

Important commands 

- Taint a node 
  `kubectl taint node <node-name> <key>=<value>:<taint-effect>`

You then add the tolerations on the pod

To erase the taints on the node edit the node object


## volumes
emptyDir voumes type get deleted when a pod is deleted too. 


