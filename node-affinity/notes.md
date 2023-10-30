unlike taints and tolerations, node affinity works by placing labels on the node and selectors on the pods with operators to write more complex rulesets. 

steps 

edit the node and place labels on te node and modify the pod definition to write the rules sets on how the pods gets placed on the node. 

## Importants operators 

In, NotIn, Exists, DoesNotExist

## Important Ruleset 
The rulesets here uses the affinity/ant-affinity language 

`requiredDuringSchedulingIgnoredDuringExecution` means that a pod is only scheduled on a node when the rule sets applies `preferredDuringSchedulingIgnoredDuringExecution` is the opposite. This only affects scheduling. existing pods are ignored.

