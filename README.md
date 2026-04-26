# Git Mastery - From Basics to Advanced Workflows

![Git Intro](./imgs/git_intro.png)

Welcome to the **Git Mastery Study Guide** - a comprehensive, hands-on reference for developers, DevOps engineers, and anyone looking to master version control. Inspired by real-world development workflows and professional best practices.

## Table of Contents

1. [Module 01: Getting Started](#module-01)
    - [What is Git?](#module-01-what)
    - [Installation & Configuration](#module-01-config)
    - [Git Architecture: The Three Trees](#module-01-arch)
    - [Foundation Cementing: Your First Repo](#module-01-foundation)
2. [Module 02: Git Basics](#module-02)
    - [Tracking Changes: Add & Commit](#module-02-tracking)
    - [Checking Status & History](#module-02-status)
    - [Comparing Changes: Diff](#module-02-diff)
    - [Foundation Cementing: The Basic Workflow](#module-02-foundation)
3. [Module 03: Branching](#module-03)
    - [Why Branch?](#module-03-why)
    - [Creating & Switching Branches](#module-03-create)
    - [Managing Branches](#module-03-manage)
    - [Foundation Cementing: Feature Branching](#module-03-foundation)
4. [Module 04: Merging & Rebasing](#module-04)
    - [Merging: Fast-Forward vs 3-Way](#module-04-merge)
    - [Rebasing: Keeping History Clean](#module-04-rebase)
    - [Resolving Conflicts](#module-04-conflicts)
    - [Foundation Cementing: Integrating Changes](#module-04-foundation)
5. [Module 05: Stashing & Cleaning](#module-05)
    - [Stashing: Saving Work in Progress](#module-05-stash)
    - [Cleaning: Removing Untracked Files](#module-05-clean)
    - [Foundation Cementing: Context Switching](#module-05-foundation)
6. [Module 06: Remotes & Collaboration](#module-06)
7. [Module 07: Inspecting & Comparing](#module-07)
8. [Module 08: Undoing Changes](#module-08)
9. [Module 09: Rewriting History](#module-09)
10. [Module 10: Tags & Releases](#module-10)
11. [Module 11: Submodules & Subtrees](#module-11)
12. [Module 12: Git Hooks](#module-12)
13. [Module 13: Advanced Workflows](#module-13)
14. [Module 14: Best Practices & Tips](#module-14)
15. [Module 15: Troubleshooting & Internals](#module-15)
16. [Appendix A: Top Git Interview Q&A](#appendix-a)
17. [Appendix B: Git Commands Cheatsheet](#appendix-b)

---

<a name="module-01"></a>
## Module 01 - Getting Started
*Phase: Foundations*

Git is a **Distributed Version Control System (DVCS)** created by Linus Torvalds in 2005 for Linux kernel development. Unlike older systems (SVN), every developer has a full copy of the repository history on their machine.

> [!NOTE]
> **Design Philosophy**: Git is built around **snapshots**, not differences. Every time you commit, Git takes a picture of what all your files look like at that moment and stores a reference to that snapshot.

<a name="module-01-config"></a>
### Installation & Configuration

Before you start, you must identify yourself to Git. These settings are stored in `~/.gitconfig`.

```bash
# Set your identity
git config --global user.name "John Doe"
git config --global user.email "john@example.com"

# Set your favorite editor
git config --global core.editor "code --wait"

# Check your settings
git config --list
```

<a name="module-01-arch"></a>
### Git Architecture: The Three Trees

Understanding Git's internal state is the key to mastering it. A Git project consists of three "trees":

| Tree | Description |
| :--- | :--- |
| **1. Working Directory** | The actual files you see and edit on your disk. |
| **2. Staging Area (Index)** | A file that stores information about what will go into your next commit. |
| **3. Repository (HEAD)** | The database of all your committed snapshots. |

**The Workflow:**
1. You modify files in your **Working Directory**.
2. You **Stage** the changes you want to include in your next snapshot (`git add`).
3. You **Commit**, which takes the files as they are in the staging area and stores that snapshot permanently to your **Repository** (`git commit`).

<a name="module-01-foundation"></a>
### Foundation Cementing: Your First Repo

```bash
# 1. Create a directory
mkdir my-project && cd my-project

# 2. Initialize Git
git init

# 3. Create a file
echo "# My Project" > README.md

# 4. Check status
git status
```

---

<a name="module-02"></a>
## Module 02 - Git Basics
*Phase: Foundations*

<a name="module-02-tracking"></a>
### Tracking Changes: Add & Commit

```bash
# Stage a specific file
git add README.md

# Stage all changes (including deletions)
git add .

# Commit with a message
git commit -m "Initial commit"

# Skip staging (only for tracked files)
git commit -a -m "Quick update"
```

> [!TIP]
> **Write Good Commit Messages**: A good commit message follows this pattern:
> `feat: add user login functionality`
> `fix: resolve crash on null sensor reading`
> The first word is the "type", followed by a concise summary in the imperative mood.

<a name="module-02-status"></a>
### Checking Status & History

```bash
# See what is staged, unstaged, and untracked
git status

# See commit history
git log

# See a pretty, one-line graph
git log --oneline --graph --decorate --all
```

<a name="module-02-diff"></a>
### Comparing Changes: Diff

```bash
# Compare Working Directory vs Staging Area
git diff

# Compare Staging Area vs Last Commit
git diff --staged

# Compare two commits
git diff <commit1> <commit2>
```

<a name="module-02-foundation"></a>
### Foundation Cementing: The Basic Workflow

```bash
# Edit a file
echo "New line" >> README.md

# See the difference
git diff

# Stage and commit
git add README.md
git commit -m "docs: update readme with new line"

# Verify in log
git log -n 1
```

---

<a name="module-03"></a>
## Module 03 - Branching
*Phase: Workflow*

Branches are pointers to specific commits. They allow you to diverge from the main line of development and continue to do work without messing with that main line.

<a name="module-03-create"></a>
### Creating & Switching Branches

```bash
# Create a new branch
git branch feature-login

# Switch to a branch
git checkout feature-login
# OR (modern Git)
git switch feature-login

# Create and switch in one command
git checkout -b feature-logout
# OR (modern Git)
git switch -c feature-logout
```

<a name="module-03-manage"></a>
### Managing Branches

```bash
# List all local branches
git branch

# List all branches (local + remote)
git branch -a

# Delete a branch (merged)
git branch -d feature-login

# Force delete a branch (unmerged)
git branch -D feature-failed-experiment
```

<a name="module-03-foundation"></a>
### Foundation Cementing: Feature Branching

```bash
# Start a new feature
git switch -c feat-sensor-driver

# Make some changes
touch sensor.c
git add sensor.c
git commit -m "feat: add basic sensor driver"

# Switch back to main
git switch main
```

---

<a name="module-04"></a>
## Module 04 - Merging & Rebasing
*Phase: Workflow*

Once you've finished work on a branch, you need to bring those changes back into your main line.

<a name="module-04-merge"></a>
### Merging: Fast-Forward vs 3-Way

**Fast-Forward Merge:** Happens when the destination branch has no new commits since you branched off. Git just moves the pointer forward.

**3-Way Merge:** Happens when both branches have diverged. Git creates a new "merge commit" that has two parents.

```bash
# Merge feature into main
git switch main
git merge feat-sensor-driver
```

<a name="module-04-rebase"></a>
### Rebasing: Keeping History Clean

Rebasing takes all the changes that were committed on one branch and "replays" them on another.

```bash
git switch feat-sensor-driver
git rebase main
```

> [!WARNING]
> **The Golden Rule of Rebasing**: Never rebase branches that have been pushed to a public repository. It rewrites history and will break things for your teammates.

<a name="module-04-conflicts"></a>
### Resolving Conflicts

Conflicts happen when Git can't automatically merge changes (e.g., the same line was modified in both branches).

1. Git stops the merge and marks the files as conflicted.
2. You open the files and look for `<<<<<<<`, `=======`, and `>>>>>>>`.
3. You edit the file to resolve the conflict.
4. `git add <file>` to mark it as resolved.
5. `git commit` to finish the merge.

<a name="module-04-foundation"></a>
### Foundation Cementing: Integrating Changes

```bash
# Simulate a conflict
git switch main
echo "Main change" > conflict.txt
git add conflict.txt && git commit -m "main change"

git switch -c feat-conflict
echo "Feature change" > conflict.txt
git add conflict.txt && git commit -m "feature change"

git switch main
git merge feat-conflict
# CONFLICT! Edit conflict.txt, then:
git add conflict.txt
git commit -m "merge: resolve conflict in conflict.txt"
```

---

<a name="module-05"></a>
## Module 05 - Stashing & Cleaning
*Phase: Utility*

<a name="module-05-stash"></a>
### Stashing: Saving Work in Progress

Stashing takes your uncommitted changes (both staged and unstaged) and saves them on a stack for later use.

```bash
# Save changes to stash
git stash

# Save with a message
git stash save "WIP: sensor calibration"

# List stashes
git stash list

# Apply the most recent stash and keep it in the list
git stash apply

# Apply and remove from the list
git stash pop

# Drop a specific stash
git stash drop stash@{0}
```

<a name="module-05-clean"></a>
### Cleaning: Removing Untracked Files

```bash
# See what would be deleted
git clean -n

# Actually delete untracked files
git clean -f

# Delete untracked directories as well
git clean -fd
```

<a name="module-05-foundation"></a>
### Foundation Cementing: Context Switching

```bash
# You're working on a feature but need to fix a bug on main
git status # Uncommitted changes
git stash
git switch main
# ... fix bug ...
git switch feat-x
git stash pop
```

---

<a name="module-06"></a>
## Module 06 - Remotes & Collaboration
*Phase: Collaboration*

Remotes are versions of your project that are hosted on the internet or network somewhere.

<a name="module-06-clone"></a>
### Clone, Pull, Push, Fetch

```bash
# Clone a repository
git clone https://github.com/user/repo.git

# See remotes
git remote -v

# Add a remote
git remote add origin https://github.com/user/repo.git

# Fetch changes from remote (doesn't merge)
git fetch origin

# Pull changes (fetch + merge)
git pull origin main

# Push changes
git push origin main
```

> [!IMPORTANT]
> **Upstream Branches**: When you push for the first time, use `-u` (or `--set-upstream`) to link your local branch to the remote one. This allows you to just type `git pull` or `git push` later.
> `git push -u origin main`

---

<a name="module-07"></a>
## Module 07 - Inspecting & Comparing
*Phase: Utility*

<a name="module-07-show"></a>
### Show & Blame

```bash
# See details of a specific commit
git show <commit_hash>

# See who changed what line in a file
git blame README.md
```

<a name="module-07-log"></a>
### Advanced Logging

```bash
# See history of a specific file
git log -- README.md

# See history of a specific function (if supported by language)
git log -L :main:main.c

# Search commit messages for a string
git log --grep="fix"

# See changes by author
git log --author="John Doe"
```

---

<a name="module-08"></a>
## Module 08 - Undoing Changes
*Phase: Recovery*

Git is very good at undoing mistakes. Depending on where the change is (Working Directory, Staging Area, or Repository), there's a command for it.

<a name="module-08-reset"></a>
### Reset (The Power Tool)

`git reset` moves the HEAD pointer and optionally updates the index and working directory.

| Mode | HEAD moves? | Index updates? | Working Dir updates? | Use Case |
| :--- | :---: | :---: | :---: | :--- |
| `--soft` | ✅ | ❌ | ❌ | Undo commit, keep changes staged |
| `--mixed` (default) | ✅ | ✅ | ❌ | Undo commit, unstage changes |
| `--hard` | ✅ | ✅ | ✅ | **DANGEROUS**: Wipe all changes |

```bash
# Undo last commit, keep changes in staging
git reset --soft HEAD~1

# Unstage a file
git reset HEAD README.md
```

<a name="module-08-revert"></a>
### Revert (The Safe Way)

`git revert` creates a **new commit** that does the exact opposite of a previous commit. This is the preferred way to undo changes on shared branches.

```bash
git revert <commit_hash>
```

<a name="module-08-checkout"></a>
### Checkout/Restore

```bash
# Discard changes in working directory (old Git)
git checkout -- README.md

# Discard changes in working directory (modern Git)
git restore README.md

# Restore a file from a specific commit
git restore --source=HEAD~2 README.md
```

---

<a name="module-09"></a>
## Module 09 - Rewriting History
*Phase: Advanced*

<a name="module-09-amend"></a>
### Amend

Forgot to add a file or made a typo in the commit message?

```bash
git add forgotten_file.c
git commit --amend -m "feat: add sensor driver and config"
```

<a name="module-09-rebase"></a>
### Interactive Rebase

The "Swiss Army Knife" of Git. It allows you to edit, squash, and reorder commits.

```bash
# Rebase the last 3 commits
git rebase -i HEAD~3
```

In the editor that opens, you can change `pick` to:
- `reword`: Change the commit message.
- `edit`: Stop for amending.
- `squash`: Combine this commit with the previous one.
- `drop`: Remove the commit entirely.

---

<a name="module-10"></a>
## Module 10 - Tags & Releases
*Phase: Release*

Tags are used to mark specific points in history as being important (e.g., v1.0, v2.0).

<a name="module-10-tags"></a>
### Lightweight vs Annotated Tags

**Lightweight Tags:** Just a pointer to a commit.
```bash
git tag v1.0-lw
```

**Annotated Tags:** Stored as full objects in the Git database. They contain the tagger name, email, date, and a message. **Always use these for releases.**
```bash
git tag -a v1.0 -m "Production release v1.0"
```

```bash
# List tags
git tag

# Push tags to remote (they aren't pushed by default)
git push origin v1.0
# OR push all tags
git push origin --tags
```

---

<a name="module-11"></a>
## Module 11 - Submodules & Subtrees
*Phase: Advanced*

Sometimes you need to include another Git repository inside your own.

<a name="module-11-submodules"></a>
### Submodules

A submodule is a record in your main repository that points to a specific commit in another repository.

```bash
# Add a submodule
git submodule add https://github.com/user/lib.git external/lib

# Clone a repo with submodules
git clone --recursive https://github.com/user/project.git

# Update submodules
git submodule update --init --recursive
```

---

<a name="module-12"></a>
## Module 12 - Git Hooks
*Phase: Automation*

Hooks are scripts that Git executes before or after events such as `commit`, `push`, and `receive`.

<a name="module-12-hooks"></a>
### Common Hooks

Hooks are stored in `.git/hooks/`.

| Hook | When it runs | Use Case |
| :--- | :--- | :--- |
| `pre-commit` | Before commit message is entered | Run linters/tests |
| `commit-msg` | After message is entered | Enforce message format |
| `pre-push` | Before pushing to remote | Prevent pushing to main |
| `post-merge` | After a successful merge | Install dependencies |

```bash
# Example: Create a pre-commit hook to prevent large files
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/sh
# Prevent committing files larger than 5MB
MAX_SIZE=5242880
for file in $(git diff --cached --name-only); do
    size=$(stat -c%s "$file")
    if [ $size -gt $MAX_SIZE ]; then
        echo "Error: $file is too large ($size bytes)."
        exit 1
    fi
done
EOF
chmod +x .git/hooks/pre-commit
```

---

<a name="module-13"></a>
## Module 13 - Advanced Workflows
*Phase: Strategy*

<a name="module-13-gitflow"></a>
### Git Flow

A strict branching model designed around the project release.
- `main`: Stores official release history.
- `develop`: Integration branch for features.
- `feature/*`: For developing new features.
- `release/*`: For preparing a new production release.
- `hotfix/*`: For quickly patching production releases.

<a name="module-13-githubflow"></a>
### GitHub Flow

A lightweight, branch-based workflow.
1. Create a branch from `main`.
2. Commit changes.
3. Open a Pull Request (PR).
4. Discuss and review code.
5. Merge into `main`.

---

<a name="module-14"></a>
## Module 14 - Best Practices & Tips
*Phase: Professionalism*

<a name="module-14-ignore"></a>
### .gitignore

Always exclude build artifacts, temporary files, and sensitive data.

```bash
# .gitignore example
node_modules/
dist/
*.log
.env
```

<a name="module-14-aliases"></a>
### Aliases

Save time by creating shortcuts for common commands.

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --decorate --all"
```

---

<a name="module-15"></a>
## Module 15 - Troubleshooting & Internals
*Phase: Mastery*

<a name="module-15-reflog"></a>
### Reflog (The Safety Net)

Git keeps a log of where your HEAD has been. If you accidentally `git reset --hard` and lose commits, `reflog` can save you.

```bash
git reflog
# Find the commit hash before the mistake
git reset --hard <hash>
```

<a name="module-15-bisect"></a>
### Bisect (Finding Bugs)

Git bisect uses binary search to find the exact commit that introduced a bug.

```bash
git bisect start
git bisect bad                 # Current version is bad
git bisect good v1.0           # v1.0 was good
# Git will checkout a middle commit. Test it.
git bisect good                # If it's good
# ... repeat until Git finds the culprit ...
git bisect reset
```

---

<a name="appendix-a"></a>
## Appendix A - Top Git Interview Q&A

**Q1. What is the difference between `git pull` and `git fetch`?**
- `git fetch`: Downloads changes from remote but doesn't merge them.
- `git pull`: Downloads changes AND merges them into your current branch (`fetch` + `merge`).

**Q2. What is a "detached HEAD"?**
It happens when you checkout a specific commit instead of a branch. You are no longer on a branch. To fix, switch back to a branch: `git switch main`.

**Q3. What is the difference between `git reset` and `git revert`?**
- `reset`: Moves the branch pointer back in time (rewrites history).
- `revert`: Creates a new commit that undoes the changes (safe for shared branches).

**Q4. How do you resolve a merge conflict?**
Edit the conflicted files to choose the desired code, `git add` the files, and `git commit`.

**Q5. What is `git stash`?**
It temporarily shelves (stashes) changes you've made to your working copy so you can work on something else, and then come back and re-apply them later.

---

<a name="appendix-b"></a>
## Appendix B - Git Commands Cheatsheet

| Category | Command | Description |
| :--- | :--- | :--- |
| **Setup** | `git init` | Initialize a local repo |
| | `git clone <url>` | Clone a remote repo |
| **Basics** | `git add <file>` | Stage changes |
| | `git commit -m "msg"` | Commit changes |
| | `git status` | Check status |
| | `git log` | See history |
| **Branching** | `git branch <name>` | Create branch |
| | `git switch <name>` | Switch branch |
| | `git merge <name>` | Merge branch |
| **Remotes** | `git remote add <name> <url>` | Add remote |
| | `git push <remote> <branch>` | Push changes |
| | `git pull <remote> <branch>` | Pull changes |
| **Undoing** | `git reset --hard <hash>` | Wipe changes |
| | `git revert <hash>` | Undo commit safely |
| | `git stash` | Save WIP changes |

---

*This guide was created to help developers master Git. It is designed to be a living reference.*

*Modeled after: [Robotics C++ Notes](https://github.com/arjunskumar/Robotics_CPP_Notes)*

