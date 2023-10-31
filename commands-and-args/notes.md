In docker, `ENTRYPOINT` is a default command, and then `CMD` is appended to it. In k8s, `command` field sort of  corresponds to the docker entry point while the `args` field corresponds to the cmd. There's naunces to this, but that's the general idea.

N/B: The commands and args in the pod definition always takes precedent to the container/dockefile. 