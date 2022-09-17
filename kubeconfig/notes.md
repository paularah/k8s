kube config fle that configure the cluster and its authentication and authorization config i typically located in `$HOME/.kube/config` directory. Users, clusters and contexts are listed in the kubeconfig file. A context associates a user with a cluster. 

Authorization basically happen in 4 mains ways. RBAC, ABAC, webhooks and Node. 
k8s internally uses the Node access control for kubelet to asses the cluster. webhooks relies on an external proivder to validate authorization mechannisms. ABAC relies on JSON files specificy the access control while  RBAC relies on role and role bindings 
