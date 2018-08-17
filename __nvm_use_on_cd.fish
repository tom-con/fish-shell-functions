function __nvm_use_on_cd -v PWD
    if test -e .nvmrc
        nvm use
        return
    end
    
    if test -e .node-version
        nvm use (cat .node-version)
        return
    end
end
