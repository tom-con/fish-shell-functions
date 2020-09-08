function gdh
    if [ -n "$argv[1]" ]
        if [ -e "$argv[1]" ] and not [ -e "$argv[2]" ]
            git diff HEAD~$argv[1]
        else
            git diff $argv[2]~$argv[1]
        end
    else
        git diff HEAD
    end
end

