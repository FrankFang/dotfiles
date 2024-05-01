# Created by newuser for 5.9

source_if_exists() {
    [ -f "$1" ] && source "$1"
}
command_exists() {
    if command -v $1 >/dev/null 2>&1; then
        echo "Detected $1 installed"
        [ -n "$2" ] && $2
        return 0
    else
        echo "You'd better install $1"
        return 1
    fi
}


title() {
    echo "######## $1 ########"
}

###############################################################################
#
HISTFILE=$HOME/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY


source_if_exists "$HOME/.alias"

title zinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# If you source zinit.zsh after compinit, add the following snippet after sourcing zinit.zsh:
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

title "load plugins"

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Snippet
zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

title "theme"

# pure theme
# zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
# zinit light sindresorhus/pure

# starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship


title "fnm"
if_fnm() {
    eval "$(fnm env --use-on-cd)"
}
command_exists fnm if_fnm


title "pnpm"
export PNPM_HOME="/home/fang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm
export PNPM_HOME="/home/fang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
