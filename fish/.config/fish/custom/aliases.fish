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
    command eza -Fla --git --group-directories-first --icons
end
function tree
    command eza --tree --icons $argv
end
function cl
    command clear; and neofetch
end

# xclip
function pbcopy 
    command xclip -selection clipboard $argv
end
function pbpaste 
    command xclip -selection clipboard -o $argv
end
