# Product Dev Environment

This repository is an orchestration layer to develop and run the product's microservices locally using Docker Compose. It links the two microservices (`order-service` and `telegram-bot`) as Git submodules and spins them up together with RabbitMQ.

---

## 📂 Project Structure

    product-dev-env/

    ├── order-service/ # Git submodule for the order service
    ├── telegram-bot/ # Git submodule for the telegram bot service
    ├── docker-compose.yml # Compose file to run all services + RabbitMQ
    ├── Makefile # Helper commands to manage the environment
    └── run.sh # Optional convenience script


---

## 🚀 Getting Started

### Prerequisites

- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- SSH access or HTTPS access configured for the microservice repos

---

### Clone this repo with submodules

```bash

git clone --recurse-submodules <repo-url>
cd product-dev-env
```

If you already cloned without --recurse-submodules, run:
```bash

git submodule update --init --recursive
```

### Running the full stack
Use the Makefile commands:
```bash

make up      # Pull submodules, build images, and start services
```

This will start:

RabbitMQ (with management UI on http://localhost:15672 — user/pass: guest/guest)

Order Service API on http://localhost:8000

Telegram Bot service (reads Telegram BOT_TOKEN from telegram-bot/.env)

## 🛠️ Development Tips
To make code changes visible immediately during development, volumes are mounted from host to container.

For the Telegram bot, make sure to put your BOT_TOKEN in telegram-bot/.env.

RabbitMQ Management UI is available at http://localhost:15672.

Use make logs to debug services in real time.

## 🧩 Troubleshooting
If the services fail to connect to RabbitMQ, verify the broker URL environment variable:
```bash

amqp://guest:guest@rabbitmq:5672/
```

If submodules don’t update, try:

```bash

git submodule sync
git submodule update --init --recursive
```

