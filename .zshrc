#.zshrc

#Enable colors and change prompt
autoload -U colors and colors
# RPROMPT="%F{yellow}%~%f"
PROMPT="
%B%F{#ff5f00}%n%f%F{white}@%f%F{#87ff00}%M%f %F{white}in%f %F{#00ff87}%2~%f     
%F{white}$%f %b"

#history in cache 
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/.zhistory
setopt SHARE_HISTORY

#Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
#auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)        #Include hidden files

#vi mode
bindkey -v  
export KEYTIMEOUT=1


# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line


#use vim keys in tab completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
#fix backspace bug when switching modes
bindkey "^?" backward-delete-char


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# Control bindings for programs
# bindkey -s "^g" "lc\n"
# bindkey -s "^h" "history 1\n"
# bindkey -s "^l" "clear\n"
# bindkey -s "^d" "dlfile\n"
#source aliases and plugins
[ -f "$HOME/.config/shell-scripts/aliasrc" ] && source "$HOME/.config/shell-scripts/aliasrc"
#for f in ~/.config/shellscripts/*; do source "$f"; done
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=green'
neofetch
