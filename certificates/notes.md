

to specify alternate/DNS names for the kube-apisevrer, create an openssl config file `openssl.cnf` and pass this in when creating 
certifictae signing request. 

### important open ssl commands
* `openssl genrsa -out ca.key 2048` generate keys
* `openssl req -new -key ca.key -subj "/CN-KUBERNETES-CA" -out ca.csr` create a certificate signing request
* `openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt` self signed certficates 
* `openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt` signe certificates with CA key pair
* `openssl x509 -in file-path.crt -text -noout` read certificates 


