# Peco
function peco_select_ghq
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    ghq list -p | peco $peco_flags | read line
    if test $line
        cd $line
        commandline -f repaint
    end
end

function peco_select_history
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    history | peco $peco_flags | read line
    if test $line
        commandline $line
    else
        commandline ''
    end
end

function peco_select_z
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    z -l | sort -rn | cut -c 12- | peco $peco_flags | read line
    if test $line
        cd $line
        commandline -f repaint
    end
end

function peco_select_file
    set -l query (commandline)
    if test -n $query
        set peco_flags --query "$query"
    end

    fd | peco $peco_flags | read line
    if test $line
        commandline "$EDITOR $line"
        commandline -f execute
    end
end
