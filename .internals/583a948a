if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx VISUAL nvim
    set -gx EDITOR nvim
    alias c="clear"
    eval (ssh-agent -c) &> /dev/null
    ssh-add ~/.ssh/github &> /dev/null
end

# pnpm
set -gx PNPM_HOME "/home/adam/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end