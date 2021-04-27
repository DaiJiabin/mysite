printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

eval $(ssh-agent -s)

ssh-add ~/.ssh/windows

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*"  ]; then
        msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

cd ..

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