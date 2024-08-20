#!/bin/bash
echo "Running init"

if [ -z "$1" ]; then
  echo "Usage: $0 <remote-repo-url>"
  exit 1
fi

REMOTE_REPO_URL=$1
BRANCH_NAME=${2:-master}

# Create a .gitignore file
cat <<EOL > .gitignore
# Ignore node_modules
node_modules/

# Ignore logs
logs/
*.log

# Ignore OS generated files
.DS_Store
Thumbs.db

# Ignore environment variables
.env

# Ignore build directories
dist/
build/

# Ignore dependency directories
vendor/

# Ignore IDE specific files
.vscode/
.idea/

# Ignore compiled files
*.out
*.class
*.o

# Ignore temporary files
*.tmp
*.swp
*~
EOL

git init

git add .

git commit -m "Initial commit"

git remote add origin $REMOTE_REPO_URL

git push -u origin $BRANCH_NAME

