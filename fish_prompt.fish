function _arrows
    echo (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯'
end

function _render_ahead -a count
    if [ $count != 0 ]
        echo "+$count"
    end
end

function _git_stat
    if [ (__git_branch_name) ]
        set -l branch (__git_branch_name)
        set -l ahead (__git_ahead_count $branch)
        set -l render_ahead (_render_ahead $ahead)

        if not [ (__is_git_dirty) ]
            set branchColor "green"
        else
            set branchColor "red"
        end
  
        echo (set_color $branchColor)$branch (set_color magenta)$render_ahead
    else
        echo (set_color magenta)"no-git"
    end
end

function fish_prompt
    set -l git_stat (_git_stat)
    set -l arrows (_arrows)
    # Main
    echo -n (set_color cyan)(prompt_pwd)" 🦑  $git_stat $arrows "
end
