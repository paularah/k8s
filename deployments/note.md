create a deployment imperatively with kubectl create and add in the neccessary info like the image name, replica, etc. You can scale an existing deployment with `kubectl scale deployment <deployment name> --replicas=<replica num>`

The default deployment strategy is a rolling update. You can alos use a recreate strategy 

## important commnads

`k apply -f <file.yaml>`
`k set image deployment.v1.apps/<deployment-name>  <image-name>`
`k rollout status deployment<deloyment-name>`
`k rollout history deployment<deployment-name>`
`k rollout undo deployment/<deployment-name>`


