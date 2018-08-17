function __broadcast_git_status -v PWD
    if test -d .git
        echo Currently on branch (set_color red)'☱'(set_color yellow)'☲'(set_color blue)'☴' (set_color green) (git rev-parse --abbrev-ref HEAD) (set_color blue)'☴'(set_color yellow)'☲'(set_color red)'☱' 
    end
end
