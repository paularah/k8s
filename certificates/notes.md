

to specify alternate/DNS names for the kube-apisevrer, create an openssl config file `openssl.cnf` and pass this in when creating 
certifictae signing request. 

N/B: when using the linux base64 utility to encode a text, you can use the `-w 0` flag to esnure you dont have line breaks.   

## important commands 
* `k get csr` get available csr 
* `k certificte approve <csr-name>` approve a csr, this creates a certificate you can the base64 decode 
* `k certificate deny <csr-name>` 
* `k delete csr <csr-name>`

### important open ssl commands
* `openssl genrsa -out ca.key 2048` generate keys
* `openssl req -new -key ca.key -subj "/CN-KUBERNETES-CA" -out ca.csr` create a certificate signing request
* `openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt` self signed certficates 
* `openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt` signe certificates with CA key pair
* `openssl x509 -in file-path.crt -text -noout` read certificates 


