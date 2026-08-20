help: ## Display available targets
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z0-9_-]+:.*## / {printf "\033[36m%-28s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Start services in the foreground
	docker compose up

detach: ## Start services in the background
	docker compose up -d

down: ## Stop and remove services
	docker compose down

logs: ## Follow service logs
	docker compose logs -f

helm: ## Deploy AgentsView with Helm to the agentsview namespace
	helm upgrade --install agentsview ./agentsview-chart \
		--namespace agentsview \
		--create-namespace \
		--set homeDir=$(HOME)

helm-down: ## Uninstall the Helm-deployed AgentsView
	helm uninstall agentsview --namespace agentsview

lint: ## Lint the Helm chart and docker-compose.yml
	helm lint ./agentsview-chart --set homeDir=$(HOME)
	yamllint docker-compose.yml
