function k9s --description 'k9s Wrapper to handle different environments based on the first argument (project name)'
    set cmd $argv[1]
    set args (string join ' ' $argv[2..-1])

    switch $cmd
        case accretio
            k9s -n df-patrimony-uat1 -n df-patrimony-dev -n df-patrimony-prep $args
        case '*'
            k9s $argv
    end
end
