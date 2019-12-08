cdls()
{
    \cd "$@" && ls 
}
alias cd="cdls"

#if [ -d "$HOME/bin" ]; then
#    PATH="$HOME/bin:$PATH"
#fi
