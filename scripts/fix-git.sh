
#!/usr/bin/env bash
set -euo pipefail

correct="$1"
test -n "$correct" || { echo "usage: git-fix-author correct_email"; exit 1; }

git commit --amend --author "$(git config user.name) <$correct>" --no-edit
