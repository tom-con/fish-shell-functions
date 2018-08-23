function __broadcast_git_status -v PWD
    if not [ (__is_git_dirty) ]
        set changeEmoji "✅  "
    else
        set changeEmoji "⚠️  "
    end
    git status > /dev/null ^ /dev/null
    if test $status -eq 0
        echo Currently on branch (set_color cyan)'☱'(set_color yellow)'☲'(set_color magenta)'☴' (set_color green) (git rev-parse --abbrev-ref HEAD) $changeEmoji  (set_color magenta)'☴'(set_color yellow)'☲'(set_color cyan)'☱' 
    end
end
