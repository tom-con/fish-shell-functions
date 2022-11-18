function _arrows
    echo (set_color B339FF)'❯'(set_color C465FF)'❯'(set_color D591FF)'❯'(set_color EED3FF)'❯'(set_color FFFFFF)'❯'
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
    set -l shinto (set_color 880000)"⛩"
    # Main
    echo -n  $shinto" "(set_color 4DD2EB)(prompt_pwd)(set_color 880000)" "$shinto  $git_stat 🦑  $arrows " "
end
