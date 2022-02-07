#Start minikube
.PHONY: minikube_start
minikube_start:
	@minikube start

#Stop minikube
.PHONY: minikube_delete
minikube_delete:
	@minikube delete

#Build calvin
.PHONY: build_calvin
build_calvin:
	@docker build -t calvin:latest -f calvin/Dockerfile .

#Build sai
.PHONY: build_sai
build_sai:
	@docker build -t sai:latest -f sai/Dockerfile .

#Deploy calvin
.PHONY: deploy_calvin
deploy_calvin: build_calvin
	@kubectl -n calvin delete deployment calvin
	@kubectl -n calvin apply -f calvin/deploy/secret.yaml
	@kubectl -n calvin apply -f calvin/deploy/deployment.yaml
	@kubectl -n calvin apply -f calvin/deploy/service.yaml

#Deploy sai
.PHONY: deploy_sai
deploy_sai: build_sai
	@kubectl -n sai delete deployment sai
	@kubectl -n sai apply -f sai/deploy/secret.yaml
	@kubectl -n sai apply -f sai/deploy/deployment.yaml
	@kubectl -n sai apply -f sai/deploy/service.yaml


#Deploy all
.PHONY: deploy_all
deploy_all: deploy_calvin deploy_sai