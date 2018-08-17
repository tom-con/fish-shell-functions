function killport --description 'Kill a process by port'
    for line in (lsof -i tcp:$argv[1])
        echo $line >> lsof.txt
    end
    if test -e lsof.txt
        set ports (awk '{print $2}' lsof.txt)
        for port in $ports
            if echo $port | string match -r '[0-9]{5}'
                kill $port
                echo "Process running on port $port has been killed"
            end
        end
        rm lsof.txt
    end
end

