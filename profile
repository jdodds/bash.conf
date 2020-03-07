# non-bash-specific (or bash-specific-but-guarded) env vars and setup in me pls

[ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
[ ! -d "$HOME/.local/bin" ] && mkdir -p "$HOME/.local/bin"

PATH="$HOME/bin:$HOME/.local/bin:$PATH"

[ -f "$HOME/.profile.local" ] && . "$HOME/.profile.local"
