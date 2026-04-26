#!/bin/bash

# Git Workflow Demo Script
# This script simulates a real-world Git scenario:
# 1. Initialize a repo
# 2. Create a main commit
# 3. Create a feature branch
# 4. Create a conflict
# 5. Resolve conflict and merge

set -e # Exit on error

# Cleanup old demo
rm -rf git_demo_temp
mkdir git_demo_temp
cd git_demo_temp

echo "=== 1. Initializing Repository ==="
git init
git config user.name "Demo User"
git config user.email "demo@example.com"

echo "=== 2. Initial Commit on Main ==="
echo "Project Title" > README.md
git add README.md
git commit -m "Initial commit"

echo "=== 3. Creating Feature Branch ==="
git checkout -b feat-sensor
echo "Sensor Driver Code" > sensor.c
git add sensor.c
git commit -m "feat: add sensor driver"

echo "=== 4. Creating a Conflict ==="
# Modify README on feature branch
echo "Feature Description" >> README.md
git add README.md
git commit -m "docs: add feature description"

# Switch back to main and modify README
git checkout main
echo "Main Description" >> README.md
git add README.md
git commit -m "docs: add main description"

echo "=== 5. Merging Feature into Main (Expect Conflict) ==="
set +e # Don't exit on merge conflict
git merge feat-sensor
set -e

if [ -f .git/MERGE_HEAD ]; then
    echo "--- Conflict Detected in README.md ---"
    # Resolve conflict: take both changes
    echo "Project Title" > README.md
    echo "Main Description" >> README.md
    echo "Feature Description" >> README.md
    
    git add README.md
    git commit -m "merge: resolve conflict in README.md"
    echo "--- Conflict Resolved ---"
fi

echo "=== 6. Final Log Graph ==="
git log --oneline --graph --all

echo "=== Demo Complete ==="
cd ..
rm -rf git_demo_temp
