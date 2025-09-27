if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

abbr -a -- ga 'git add'
abbr -a -- gc 'git commit -v'
abbr -a -- gs 'git status'
abbr -a -- lst 'ls --tree'
abbr -a -- l 'ls -lah'
abbr -a -- vim nvim
abbr -a -- v nvim

fish_vi_key_bindings
# Adds the history-pager to Ctrl-r when in INSERT mode.
bind -M insert \cr history-pager

# Add up/down command history for the already provided input to Ctrl+j/k (same as up/down in `fish_default_key_bindings`)
bind -M insert \ck up-or-search   
bind -M insert \cj down-or-search

zoxide init fish --cmd cd | source
thefuck --alias | source
