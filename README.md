# `got` - git for lazy devs

`got` is a simple CLI with a single shell script that wraps git and makes it easier and faster to use.

# Installation

You can copy or symlink `got` to a file named `got` in your `PATH`. For instance:
```bash
# Copy
sudo cp ./bin/got /usr/bin/got
```
Or symlink so it auto updates when you pull this repo:
```bash
# Symlink
sudo ln -s ./bin/got /usr/bin/got
```

# Commands

`got` has only 7 commands:

## `got push <commit message>`

When I commit my changes, I always run the same 3 commands:
1. `git add -A`
2. `git commit -a -m <message>`
3. `git push`

The problem is, there's no reason for me to type these every time. I always want to commit and push everything I changed.

With `got`, you can just type `got push <message>` to commit and push your changes. It's also quite helpful when you're in a hurry.

## `got branch <branch name>`

Tries to `git switch` to a branch, and if it fails, it automatically makes the branch and switches to it for you.

## `got init <remote>`

Runs these commands:
```bash
git init
git add -A
git commit -a -m "Initial commit"
git branch -M main
git remote add origin "$REMOTE"
git push -u origin main
```

This is inspired by the commands GitHub shows you when you make a new empty repository.

## `got clone <remote>`

It's just `git clone --recurse-submodules <remote>`

## `got stash`

Just `git stash`, included for same reason as `git pull`

## `got restore`

its just `git stash pop`

## `got pull`

Just `git pull`, included so you can use `got` for everything and never usually have to use git commands

It's helpful so you don't have to use different CLIs to pull and push, you can just `got pull` and `got push <message>`

# License

MIT license
