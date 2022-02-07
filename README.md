# Simple Minikube Server

This is a simple minikube server with two applications fronted by
services and container secrets that are stored as env variables.

## How to deploy

### What do you need?

1) Two terminals (One for deployment + one for tunneling)
2) minikube installed
3) docker installed
4) Makefile xcode install

### Steps

On Terminal 1 (preferably inside vsc terminal):

1) `make minikube_start`
2) `val $(minikube docker-env)`

On Terminal 2:

3) `minikube tunnel`

On Terminal 1:

3) `make deploy_all`
4) `kubectl get $(pods OR services OR secrets) --all-namespaces`

On browser:

5) `http://127.0.0.1:8080/` for sai
6) `http://127.0.0.1:8081/` for calvin

There are three endpoints /, /goodbye & /login