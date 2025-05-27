
#!/usr/bin/env bash
set -e

# List of directories to create
dirs=(
  ".github/workflows"
  "helm/control-plane"
  "helm/ingestion-service"
  "helm/workers"
  "k8s"
  "terraform/modules/network"
  "terraform/modules/database"
  "terraform/modules/iam"
  "scripts"
  "services/api-gateway"
  "services/control-plane"
  "services/ingestion-service"
  "services/routing-service"
  "services/status-callback"
  "services/workers/email-worker"
  "services/workers/sms-worker"
  "services/workers/webhook-worker"
  "libs/common"
  "libs/events"
  "libs/db"
  "libs/config"
)

# Create directories
for dir in "${dirs[@]}"; do
  mkdir -p "$dir"
done

# Create placeholder files
touch .env.example
touch docker-compose.yml
touch README.md
touch .github/workflows/ci.yml

echo "Directory structure bootstrapped successfully."
