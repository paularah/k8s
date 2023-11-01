## Important commands 
`k cordon <node-name>` doesn't evict existing pods on the nodes, only prevents new pods from being placed on the node. 
`k drain <node-name>` migrate workloads on the node to other nodes. Think of this as gracefully migrating workloads away from a node.
`k uncordon <node-name>` marks a node as available and  now ready to receive workloads. 

N/B: The `--pod-eviction-timeout` config determines how long after a node is unreachable should be cordoned off. The default value is 5 minutes(5m0s) 