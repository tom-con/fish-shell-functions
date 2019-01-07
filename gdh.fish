function gdh
    if [ -n "$argv[1]" ]
        if [ -e "$argv[1]" ] and not [ -e "$argv[2]" ]
            git diff head $argv[1]
        else
            git diff $argv[2] $argv[1]
        end
    else
        git diff head
    end
end

