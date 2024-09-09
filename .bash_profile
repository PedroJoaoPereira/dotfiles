# sourced by bash for login shells
if shopt -q login_shell; then
    [[ -f ~/.bashrc ]] && source ~/.bashrc
else
    # non bash or non login shell
    exit 1
fi
