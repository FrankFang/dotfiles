# Created by newuser for 5.9

source_if_exists() {
    [ -f "$1" ] && source "$1"
}

title() {
    echo "######## $1 ########"
}


source_if_exists "$HOME/.alias"

title zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
