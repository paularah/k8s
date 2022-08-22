The major difference between a replication controller and a replicaset is the a replica set has a selector field. This makes sense because pods not created by the replicaset but matches the labels can still be controlled by the replicaset wkeeing the number of pods as intended. 

Replication controllers are being deprecated in favour of replica sets. 
N/B: Replica Sets have an api version of `apps/v1`

## Important commmands

- `kubectl create -f replicaset-definition` or `kubectl apply -f replicaset-defintion.yaml`
- `kubectl get replicaset`
- `kubectl delete replicaset <replicaset name>`
- `kubectl scale replicaset <replicaset name> --replicas=<replicas num>`
- `kubectl scale -f <fle definition> --replicas=<replicaNum>`
