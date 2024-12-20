#!/bin/bash
echo ***REMOVED***Running init***REMOVED***

if [ -z ***REMOVED***$1***REMOVED*** ]; then
  echo ***REMOVED***Usage: $0 <remote-repo-url>***REMOVED***
  exit 1
***REMOVED***

REMOTE_REPO_URL=$1
BRANCH_NAME=${2:-master}

# Create a .gitignore ***REMOVED***le
cat <<EOL > .gitignore
# Ignore node_modules
node_modules/

# Ignore logs
logs/
*.log
__pycache__/

# Ignore OS generated ***REMOVED***les
.DS_Store
Thumbs.db

# Ignore environment variables
.env

# Ignore build directories
dist/
build/
/target

# Ignore dependency directories
vendor/

# Ignore IDE speci***REMOVED***c ***REMOVED***les
.vscode/
.idea/

# Ignore compiled ***REMOVED***les
*.out
*.class
*.o

# Ignore temporary ***REMOVED***les
*.tmp
*.swp
*~

# Ignore Sessions
*.session
*.jpg

# Ignore venv
myenv/
venv/
EOL

git init

git add .

git commit -m ***REMOVED***Initial commit***REMOVED***

git remote add origin $REMOTE_REPO_URL

git push -u origin $BRANCH_NAME

