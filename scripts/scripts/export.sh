#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' 
print_color() {
    echo -e ***REMOVED***${1}${2}${NC}***REMOVED***
}

print_color $YELLOW ***REMOVED***Setting up environment variables...***REMOVED***

export CUSTOMER_DATABASE_URL=postgresql://postgres@localhost:5432/zine-customer
export ADMIN_DATABASE_URL=postgresql://postgres@localhost:5432/zine-admin      

# export ADMIN_DATABASE_URL=***REMOVED***postgresql://neondb_owner:UJAeR4GYgbB1@ep-weathered-grass-a5n5rj4x.us-east-2.aws.neon.tech/neondb?sslmode=require***REMOVED***
# export CUSTOMER_DATABASE_URL=***REMOVED***postgresql://zine-customer_owner:gurY4xQK2ajU@ep-frosty-smoke-a4uclfp8.us-east-1.aws.neon.tech/zine-customer?sslmode=require***REMOVED***:

# export ADMIN_DATABASE_URL=***REMOVED***postgresql://postgres:FEJyQWALW4PTo2cCpPFh@zine-dev-database-2.c98646k0y3ii.us-east-1.rds.amazonaws.com:5432/zineadmin?pool_timeout=300***REMOVED***
# export CUSTOMER_DATABASE_URL=***REMOVED***postgresql://postgres:wDQArRtmb4PzjjiWS3bP@zine-dev-database-1.c98646k0y3ii.us-east-1.rds.amazonaws.com:5432/zinewallet?pool_timeout=300***REMOVED***
print_color $GREEN ***REMOVED***Environment variables set successfully!***REMOVED***

