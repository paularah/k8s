`--namespace=<pod name> to get a pod in a specific namespace `

## Important Commands

Switch to a different namespace in other to avoid manually passing in the namespace for every kubectl command. 
`kubectl config set-context $(kubectl config current-context) --namespace=dev`
