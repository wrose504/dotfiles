# Prompt colors
autoload -U colors
colors

# Load vcs_info module to get Git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "- %{$fg[yellow]%}(%b)%{$reset_color%} "
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
export PROMPT="%{$fg_bold[blue]%}%2/%{$reset_color%} \${vcs_info_msg_0_}%{$fg_bold[white]%}>%{$reset_color%} "

# Enable command history
export HISTSIZE=50000
export SAVEHIST=10000
export HISTFILE="$HOME/.zsh_history"
export HISTTIMEFORMAT="[%F %T] "

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# With the up arrow doing prefix search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
