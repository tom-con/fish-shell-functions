function grby -a back
    set -x EDITOR true
    git rebase -i HEAD~$back --autosquash
end