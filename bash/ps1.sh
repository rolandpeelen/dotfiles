if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        RED=$(tput setaf 160)
        GREEN=$(tput setaf 10)
        YELLOW=$(tput setaf 221)
        BLUE=$(tput setaf 68)
        MAGENTA=$(tput setaf 13)
        CYAN=$(tput setaf 87)
        ORANGE=$(tput setaf 208)
        PURPLE=$(tput setaf 141)
        WHITE=$(tput setaf 256)
    else
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        PURPLE=""
        ORANGE=""
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    RED='\e[0;31m'
    GREEN="\e[1;32m"
    YELLOW="\e[1;33m"
    BLUE='\e[1;34m'
    MAGENTA="\e[1;31m"
    PURPLE="\e[1;35m"
    WHITE="\e[1;37m"
    CYAN=""
    ORANGE=""
    BOLD=""
    RESET="\e[m"
fi

export RED
export GREEN
export YELLOW
export BLUE
export MAGENTA
export CYAN
export ORANGE
export PURPLE
export WHITE
export BOLD
export RESET

## PROMPT
PS1="\[${BOLD}${WHITE}\]\u@\[${RESET}${RED}\]\h:\[${BLUE}\]\W\[${PURPLE}\]\$(__git_ps1)\[${RESET}\]$ "
