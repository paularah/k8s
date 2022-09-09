Important commands 

- Taint a node 
  `kubectl taint node <node-name> <key>=<value>:<taint-effect>`

You then add the tolerations on the pod

To erase the taints on the node edit the node object
