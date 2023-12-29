# export ZDOTDIR=$HOME/.config/zsh
# source "$HOME/.config/zsh/.zshrc"
#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh

# Handle history 
export HISTFILE=$ZDOTDIR/.zsh_history  # Refers to the path/location of the history file
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "

setopt EXTENDED_HISTORY   # Records the timestamp of each command in HISTFILE
setopt HIST_FIND_NO_DUPS  # Handling duplicate commands
setopt SHARE_HISTORY      # Share history across terminals

    # following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY # Immediately append to the history file, not just when a term is killed

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP


# completions
autoload -Uz compinit && compinit #need the next two lines for case insensitive tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

# Colors
autoload -Uz colors && colors

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger-cd^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Speedy keys
xset r rate 210 40

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome"

export DISPLAY=:0
