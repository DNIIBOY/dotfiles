if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

abbr -a -- ga 'git add'
abbr -a -- gc 'git commit -v'
abbr -a -- gs 'git status'
abbr -a -- lst 'ls --tree'

zoxide init fish --cmd cd | source
thefuck --alias | source
