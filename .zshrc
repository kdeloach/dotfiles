# Fix Ctrl+i for forward history search
stty -ixon

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory

alias ll="ls -la"
alias g=git
alias dc=docker-compose

export PATH="$PATH:/Users/Kevin-DeLoach/Library/Python/3.7/bin"

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# for PS1 colors
autoload -U colors && colors

# zsh git autocompletion
# Disabled because it makes autocompletion slow for other commands
# autoload -Uz compinit && compinit

# Old PS1
# PS1="%n@%m %1~ %#"

# add git branch to PS1
source ~/.git-prompt.sh
GIT_PS1_SHOWCOLORHINTS=1
precmd () { __git_ps1 "%n@%m %{$fg[yellow]%}%~%{$reset_color%}" "
$ " " (%s)" }

# to support deleting to nearest slash via alt+backspace
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GEM_HOME="$HOME/.gem"
export PATH="$PATH:${GEM_HOME}/bin"
