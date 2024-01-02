set -U fish_greeting
set -gx TERM xterm-kitty
# set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx BROWSER google-chrome
set -gx DISPLAY :0.0

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end
bass source ~/.nvm/nvm.sh

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

function fish_greeting
    neofetch
end

# Github: https://github.com/edheltzel/dotfiles/tree/master/fish/functions
source ~/.config/fish/custom/functions.fish
source ~/.config/fish/keybindings.fish
source ~/.config/fish/custom/aliases.fish
source ~/.config/fish/custom/cp.fish
source ~/.config/fish/custom/git-undo.fish
source ~/.config/fish/custom/pubkey.fish
source ~/.config/fish/custom/mkd.fish
source ~/.config/fish/custom/weather.fish
source ~/.config/fish/custom/ranger.fish
