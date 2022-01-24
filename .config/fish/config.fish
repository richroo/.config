set -x EXA_COLORS "da=1;36"
set -x BAT_THEME "gruvbox-dark"
set -x GOPATH ~/go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH $PATH $GOROOT/bin $GOPATH/bin ~/.cargo/bin
set -x PATH "/Users/richard/.local/bin:$PATH"

if command -v exa > /dev/null
    abbr -a l 'exa'
    abbr -a ls 'exa'
    abbr -a ll 'exa -l'
    abbr -a lll 'exa -la'
    abbr -a lt 'exa --tree --level=2 --long'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

# shortcuts
abbr -a venv ". venv/bin/activate.fish"
abbr -a senv "source (poetry env info -p)/bin/activate.fish"
abbr -a vim "nvim"
abbr -a gs "git status"
abbr -a config '/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME' 
abbr -a ff "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim"

# Evaluate direnv hooks
eval (direnv hook fish)

function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    set_color yellow
    echo -n "rich@"
    set_color blue
    echo -n (hostname)
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (basename $PWD)
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
