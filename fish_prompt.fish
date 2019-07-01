function _arrows
    echo (set_color A7A6FF)'❯'(set_color B3C4E8)'❯'(set_color D2EFFF)'❯'(set_color B3E7E8)'❯'(set_color C4FFEB)'❯'
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
            set coloredBranch (rainbow "$branch")
        else
            set coloredBranch (rainbow_red "$branch")
        end
  
        echo $coloredBranch (set_color F9347C)$render_ahead
    else
        echo (set_color 4DEBB3)"no-git"
    end
end

function fish_prompt
    set -l git_stat (_git_stat)
    set -l arrows (_arrows)
    # Main
    echo -n  "⛩  "(set_color 4DD2EB)(prompt_pwd)" ⛩  $git_stat 🦑  $arrows "
end
