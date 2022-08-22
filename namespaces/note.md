`--namespace=<pod name> to get a pod in a specific namespace `

## Important Commands

Switch to a different namespace in other to avoid manually passing in the namespace for every kubectl command. 
`kubectl config set-context $(kubectl config current-context) --namespace=dev`

count the nnumber of namespaces on a cluster

`kubectl get ns | wc -l`

`-n flag for namespaces`

get  pods or another object type in all namespaces on a cluster 

`kubectl get pods --all-namespaces | grep <specific pod>`
