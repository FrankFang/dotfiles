# Created by newuser for 5.9

source_if_exists() {
    [ -f "$1" ] && source "$1"
}


source_if_exists "$HOME/.alias"
