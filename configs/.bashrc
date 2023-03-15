set -o vi # vi mode
bind 'TAB:menu-complete' # If there are multiple matches for completion, Tab should cycle through them
bind '"\eZ":menu-complete-backward' # And Shift-Tab should cycle backwards
bind 'set show-all-if-ambiguous on' # Display a list of of the matching files
bind 'set menu-complete-display-prefix on' # Perform partial compeltion on the first Tab press, only start cycling full results on the second Tab press
bind 'set completion-ignore-case on' 
# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

# Aliases
alias kys="poweroff"
alias resetbg="feh --bg-fill --randomize ~/.wallpapers"
alias vim="nvim"
alias clipboard="xclip -selection clipboard"

# Oh-My-Bash stuff
plugins=(git)
OSH_THEME="agnoster"
export OSH=~/.oh-my-bash
OMB_USE_SUDO=false
source "$OSH"/oh-my-bash.sh

# Environment Vars
VISUAL="nvim"
EDITOR="nvim"

# ghc stuff
export PATH="~/.ghcup/bin:$PATH"
