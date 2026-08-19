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
