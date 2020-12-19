et -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add changes to git.
git add .

# Commit changes.
msg="Processing $(date)"

if [ -n "$*"  ]; then
        msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push -u origin master