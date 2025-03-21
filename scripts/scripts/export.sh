#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' 
print_color() {
    echo -e "${1}${2}${NC}"
}

print_color $YELLOW "Setting up environment variables..."

export CUSTOMER_DATABASE_URL=postgresql://postgres@localhost:5432/zine-customer
export ADMIN_DATABASE_URL=postgresql://postgres@localhost:5432/zine-admin      

# export ADMIN_DATABASE_URL="postgresql://neondb_owner:UJAeR4GYgbB1@ep-weathered-grass-a5n5rj4x.us-east-2.aws.neon.tech/neondb?sslmode=require"
# export CUSTOMER_DATABASE_URL="postgresql://zine-customer_owner:gurY4xQK2ajU@ep-frosty-smoke-a4uclfp8.us-east-1.aws.neon.tech/zine-customer?sslmode=require":

# export ADMIN_DATABASE_URL="postgresql://postgres:FEJyQWALW4PTo2cCpPFh@zine-dev-database-2.c98646k0y3ii.us-east-1.rds.amazonaws.com:5432/zineadmin?pool_timeout=300"
# export CUSTOMER_DATABASE_URL="postgresql://postgres:wDQArRtmb4PzjjiWS3bP@zine-dev-database-1.c98646k0y3ii.us-east-1.rds.amazonaws.com:5432/zinewallet?pool_timeout=300"
print_color $GREEN "Environment variables set successfully!"

