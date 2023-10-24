#!/bin/bash

# Welcome to Got, the Git wrapper for lazy developers.

COMMAND=$1

if [ -z "$COMMAND" ]; then
    echo "Got has 7 commands: \`got pull\`, \`got push\`, \`got stash\`, \`got restore\`, \`got branch\`, \`got clone\` and \`got init\`."
    exit 1
elif [ "$COMMAND" = "pull" ]; then # Pull is simple, it just runs git pull.
    git pull
    exit 0
elif [ "$COMMAND" = "push" ]; then # Push adds and commits for us. It doesn't require a message, which means in a hurry you can quickly push your changes.
    MESSAGE=$2
    if [ -z "$MESSAGE" ]; then
        MESSAGE="got"
    fi
    echo "Using message \"$MESSAGE\""
    git add -A
    git commit -a -m "$MESSAGE"
    git push
    exit 0
elif [ "$COMMAND" = "stash" ]; then # just runs git stash.
    git stash
    exit 0
elif [ "$COMMAND" = "restore" ]; then # just runs git stash pop.
    git stash pop
    exit 0
elif [ "$COMMAND" = "branch" ]; then # tries git switch, and if that fails, it tries git branch and then switch again
    BRANCH=$2
    if [ -z "$BRANCH" ]; then
        echo "You must specify a branch name."
        exit 1
    fi
    git switch "$BRANCH"
    if [ $? -ne 0 ]; then
        git branch "$BRANCH"
        git switch "$BRANCH"
    fi
    exit 0
elif [ "$COMMAND" = "clone" ]; then # git clone with recursive submodules
    REPO=$2
    if [ -z "$REPO" ]; then
        echo "You must specify a repository URL."
        exit 1
    fi
    git clone --recurse-submodules "$REPO"
    exit 0
elif [ "$COMMAND" = "init" ]; then
    REMOTE=$2
    if [ -z "$REMOTE" ]; then
        echo "You must specify a remote URL."
        exit 1
    fi
    git init
    git add -A
    git commit -a -m "Initial commit"
    git branch -M main
    git remote add origin "$REMOTE"
    git push -u origin main
    exit 0
else
    # bright red echo
    echo -e "\033[0;31mgot: unknown command '$COMMAND'\033[0m"
    exit 1
fi
