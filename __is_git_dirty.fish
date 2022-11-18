function __is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end
