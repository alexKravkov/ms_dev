# Makefile for product-dev-env

# 🧠 Usage: run `make` followed by any of the targets listed under help
.PHONY: help up down build pull logs restart rebuild

## Show this help message
help:
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

pull: ## Pull and initialize git submodules
	@git submodule update --init --recursive

build: ## Build all Docker containers
	@docker compose build

up: pull build ## Pull, build, and start all containers
	@docker compose up

run: pull build ## Pull, build, and start all containers in detached mode
	@docker compose up -d

down: ## Stop and remove containers, networks, volumes
	@docker compose down

logs: ## Tail logs from all services
	@docker compose logs -f

restart: down up ## Restart all containers

rebuild: ## Force rebuild of all services
	@docker compose build --no-cache

