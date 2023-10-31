A deployment triggers a rollout, this creates a revision(more like version of the deployment) which in turn creates replica set which the right number of pods. 

create a deployment imperatively with kubectl create and add in the neccessary info like the image name, replica, etc. You can scale an existing deployment with `kubectl scale deployment <deployment name> --replicas=<replica num>`

The default deployment strategy is a rolling update. You can also use a recreate strategy 

N/B: Anytime you use a command the modifies a deployment, you can the `--record` flag to record which specific command made changes to the deployment. You'd this on the `CHANGE-CAUSE` column of the rollout history. 

### important commands

`k apply -f <file.yaml>`
`k set image deployment.v1.apps/<deployment-name>  <image-name>`
`k rollout status deployment<deloyment-name>`
`k rollout history deployment<deployment-name>`
`k rollout undo deployment/<deployment-name>`
`k rollout undo deployment <deployment-name> --to-revision=1`
