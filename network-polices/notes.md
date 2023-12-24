There is no imperative wya to create nwtwork policies. So all rulesets will have to be created by hand. There two type of network polices. Ingress and Egress. The reuleset can either be by podselectors, namespace selector or Ip range(CIDR)


These rulesets actually work like  AND/OR operation. All rulesets that are subset of a ruleset must be satisfised and when there are multiple rulesets anyone that matches is good to go. 
