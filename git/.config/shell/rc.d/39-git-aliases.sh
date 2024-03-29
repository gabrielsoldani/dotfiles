# shellcheck shell=sh

alias g="git"
alias gap="git add -p"
alias gs="git status"
alias gsw="git switch"
alias gc="git commit"
alias gca="git commit --amend"
alias gl="git log"
alias glo="git log --oneline --decorate --graph"
alias gp="git pull"
alias gps="git push"
alias gpsu="git push --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"
alias gpsf="git push --force-with-lease"

alias cd-gitroot='cd $(git root)'
