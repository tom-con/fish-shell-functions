function grbi -a back
    git rebase -i HEAD~$back --autosquash
end