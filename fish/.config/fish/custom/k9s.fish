function k9s --description 'k9s Wrapper to handle different environments based on the first argument (project name)'
    set cmd $argv[1]
    set args (string join ' ' $argv[2..-1])

    switch $cmd
        case accretio
            command k9s -n df-patrimony-dev -n df-patrimony-uat1 -n df-patrimony-prep $args
        case compliance
            command k9s -n df-compliance-dashboard-dev $args
        case '*'
            command k9s $argv
    end
end
