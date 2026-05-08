source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
mise activate fish | source
alias hx="helix"
alias v="nvim"
alias t="tmux attach 2>/dev/null || tmux new-session"

function rbwc
    if test (count $argv) -eq 0
        echo "Usage: rbwc <entry> [user]"
        return 1
    end
    set -l field password
    set -l args $argv
    if test "$argv[-1]" = user -o "$argv[-1]" = username
        set field username
        set args $argv[1..-2]
    end
    set -l entry (string join " " $args)
    rbw get $entry --field $field | wl-copy && echo "Copied $field for '$entry'"
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
atuin init fish | source

fish_add_path ~/.local/bin
command -q starship && starship init fish | source
