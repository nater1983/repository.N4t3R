#!/bin/sh
#	Nathaniel Russell

p_VpuDPTy6hZkKAbb1A39PIvHbUaoSxS0Sc9mr


git add .
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"
BRANCH=$(git describe --contains --all HEAD)
git pull --rebase origin "$BRANCH"
git push origin "$BRANCH"
