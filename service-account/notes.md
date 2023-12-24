user accounts are for humans and service account for apps. A default service account is created with limited permisions. A secret is creaetd with a JWT token i it which can then be used to authenticate against the k8s API. A volume is also mounted in the pods `var/run/secrets` so pods can access the secrets internally

 ### N/B:

k8s `ReuestTokenAPI` has sort of replaced the default service behaviour. This largely due to the JWT tokens associated with service accounts are not time bounded( no expiry)

Now a token is no longer created and associated with a service account any longer. You have to do that associate manually by `k create token <service-account-name>`. This is a standard JWT token and you can in the duration. 
