function __render_ahead_count
    set -l branch (__git_branch_name)
    set -l ahead (__git_ahead_count $branch)
    if [ $ahead != 0 ]
        echo (set_color magenta)"+$ahead"
    end
end
