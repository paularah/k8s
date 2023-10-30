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
