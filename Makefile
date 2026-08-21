help: ## Display available targets
	@awk 'BEGIN {FS = ":.*## "}; /^[a-zA-Z0-9_-]+:.*## / {printf "\033[36m%-28s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: down update open ## Start services in the background and open the application

up: ## Start services in the foreground
	docker compose up

detach: ## Start services in the background
	docker compose up -d

down: ## Stop and remove services
	docker compose down

restart: ## Restart services
	docker compose down && \
	docker compose up -d

open: ## Open the application in the default web browser
	open http://localhost:8080

logs: ## Follow service logs
	docker compose logs -f

update: ## Update the image for the service
	docker compose pull && \
	docker compose up -d --remove-orphans
