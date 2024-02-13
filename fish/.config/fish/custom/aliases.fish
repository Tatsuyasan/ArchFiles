# ls replacement
function ls
    command eza -a --group-directories-first --icons $argv
end
function l
    command eza -Fla --sort name --git --group-directories-first --icons $argv
end
function ll
    command eza -Flagh --git --group-directories-first --icons --sort modified $argv
end
function la
    command eza -Fla --git --group-directories-first --icons $argv
end
function tree
    command eza --tree --icons $argv
end
function cl
    command clear; and neofetch
end

# git
function gs
    command git status $argv
end
function gc
    command git commit -m $argv
end

# xclip
function pbcopy
    command xclip -selection clipboard $argv
end
function pbpaste
    command xclip -selection clipboard -o $argv
end

# Docker compose
function dcu
    command docker-compose up -d
end
function dcd
    command docker-compose down
end
function dce
    command docker-compose exec
end
function dcl
    command docker-compose logs
end
function dclf
    command docker-compose logs -f
end
function dcs
    command docker-compose stop
end
function dcp
    command docker-compose ps
end

# Colorize grep output (good for log files)
function grep
    command grep --color=auto $argv
end
function egrep
    command egrep --color=auto $argv
end
function fgrep
    command fgrep --color=auto $argv
end

# confirm before overwriting something
function cp
    command cp -i $argv
end
function mv
    command mv -i $argv
end
function rm
    command rm -i $argv
end

# better mkdir
function mkdir
    command mkdir -p $argv
end

# Workspaces
function dotfiles
    cd ~/.config
end

function archfiles
    cd ~/ArchFiles
end

# Other
function man
    command man --locale=fr $argv
end

function treesize
    command ncdu $argv
end

function gpu
    command nvtop $argv
end

function main
    command tmux attach-session -t main
end
