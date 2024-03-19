#start
#
#
###############################################################################
rvenv () {
	local name="${1:-venv}" 
	local venvpath="/Users/peter/.venvs/${name}" 
	if [[ ! -d "$venvpath" ]]
	then
		echo "Error: no such venv in current directory: $name" >&2
		return 1
	fi
	if [[ ! -f "${venvpath}/bin/activate" ]]
	then
		echo "Error: '${name}' is not a proper virtual environment" >&2
		return 1
	fi
	. "${venvpath}/bin/activate" || return $?
	echo "Activated virtual environment ${name}"
}

###################

mvenv () {
	echo "Deactivate current venv to being able to use /opt/homebrew/bin/python3."
	deactivate
	local name="${1:-venv}" 
	local venvpath="/Users/peter/.venvs/${name}" 
	python3 -m venv "${venvpath}" || return
	echo "Created venv in '${venvpath}'" >&2
	rvenv "${name}"
}


###############################################################################


#rvenv gen


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#PATH="~:PATH"

# If you come from bash you might have to change your $PATH.
export DOCKER_HOST=unix://$HOME/.colima/docker.sock

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git helm taskwarrior kubectl docker python tmux z)

source $ZSH/oh-my-zsh.sh

rvenv gen

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
###############################################################################
export API_TOKEN=xxxx
###############################################################################
###############################################################################
###############################################################################
###############################################################################

#activate # as comment in zsh
setopt interactivecomments

# New history settings  https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
#export HISTCONTROL=ignoreboth:erasedups  # no duplicate entries edited to ignore the blank line start too
#export HISTFILESIZE=20000               # big big history

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n;"
export PROMPT_COMMAND="history -a; history -n; "

#set history size
#export HISTSIZE=18000
#save history after logout
#export SAVEHIST=15000
#history file
#HISTFILE=~/.zhistory

HISTFILE="$HOME/.zsh_history"
HISTSIZE=40000
SAVEHIST=36000
#setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
#setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
#setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
#setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
#setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
#setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
#setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

###############################################################################

alias pip=pip3
alias py=python3
alias py3=python3
alias python=python3
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias lt='du -sh * | sort -h'

alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'

alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias cd..='cd ..'

alias dog='cat'
alias hi='history 1'
alias gh='hi | rg'
alias h='head -n 25'
alias t='tail -n 25'
alias myip='curl "http://httpbin.org/ip"'

alias k=kubectl
alias kn='/usr/local/bin/kubectl'
alias ko='/usr/local/bin/kubectl1273'
alias knv='/usr/local/bin/kubectl version --client --output=yaml'
alias kov='/usr/local/bin/kubectl1273 version --client --output=yaml'
alias kv='kubectl version --client --output=yaml'
alias kg='kubectl get'
alias kgn='kubectl get namespaces'
alias kgpa='kubectl get pods -A'
alias kgpn='kubectl get pods -n'
alias ka='kubectl apply -f'
alias kd='kubectl delete'
alias kdn='kubectl delete namespace'
alias kgc='kubectl config get-contexts'

alias kuc='kubectl config use-context'
alias kucr='kubectl config use-context rancher-desktop'
alias kucm='kubectl config use-context minikube'
alias kucdhc='kubectl config use-context c53p092-admin'
alias kucca='kubectl config use-context c82p038-admin'

alias gkc='grep 'name:' ~/.kube/config'
alias ekcca='export KUBECONFIG=/Users/peter/Documents/MBTI_i3_dir/c82p038.kubeconfig'
alias ekcdhc='export KUBECONFIG=/Users/peter/Documents/MBTI_i3_dir/c53p092.kubeconfig'
alias ekc='export KUBECONFIG=/Users/peter/.kube/config'
alias ekcc='export KUBECONFIG=/Users/peter/.kube/.colima/colima-temp'

alias dcs='docker container ls | grep'
alias dc='docker container ls'
alias dis='docker images | grep'
alias dim="docker images"
alias di="docker images | cut -d' ' -f -1"
alias rc=rclone
alias ll='ls -la'
alias ping='ping -c 5'
alias c=clear
alias line='echo -----------------------------------------------------------------------------'
alias phr='tr ":" "\n" <<< "$PATH"'
alias zed='open -a /Applications/Zed.app -n . '


# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

###############################################################################
# important eigene functions:
# - fgit
# - geth
# - cft
# - llamami
# - llamala

###############################################################################

###############################################################################

###############################################################################
# llamamix() -> use llama enpoint of mixtral model. FUNCTION where you dont need quotes for the parameter
# do not use with special characters like *, because they will interact with your shell, files and possibly more...!!
#################
llamamix()
{
        if [[ ! -z $1 ]]
        then
                unset string
                curl -X POST http://localhost:11434/api/generate -d '{ "model": "mixtral","prompt": "'" $* "'" }' | while read line
                do
                        if ! [[ $(echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$') = "n" ]]
                        then
                                string+=$( echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$')
                        else
                                string+=" "
                        fi
                done
                echo $string
                unset string
        else
                echo "Parameter missing"
        fi
}
###############################################################################
# llamamiquotes() -> use llama enpoint of mistral model. FUNCTION where you need quotes for the parameter
#################
llamamiquotes()
{
    if [[ ! -z $1 ]] then
         unset string; curl -X POST http://localhost:11434/api/generate -d '{ "model": "mistral","prompt": "'" $1 "'" }' | while read line;  do  if ! [[ $(echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$') = "n"  ]]; then string+=$( echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$'); else string+=" ";  fi; done; echo $string; unset string;
    else
         echo "Parameter missing"
    fi
}
###############################################################################
# llamami() -> use llama enpoint of mistral model. FUNCTION where you dont need quotes for the parameter
# do not use with special characters like *, because they will interact with your shell, files and possibly more...!!
#################
llamami()
{
        if [[ ! -z $1 ]]
        then
                unset string
                curl -X POST http://localhost:11434/api/generate -d '{ "model": "mistral","prompt": "'" $* "'" }' | while read line
                do
                        if ! [[ $(echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$') = "n" ]]
                        then
                                string+=$( echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$')
                        else
                                string+=" "
                        fi
                done
                echo $string
                unset string
        else
                echo "Parameter missing"
        fi
}
###############################################################################
# llamala() -> use ollama enpoint of llama2 model. FUNCTION where you dont need quotes for the parameter
#################
llamala()
{
	if [[ ! -z $1 ]]
	then
		unset string
		curl -X POST http://localhost:11434/api/generate -d '{ "model": "llama2","prompt": "'" $* "'" }' | while read line
		do
			if ! [[ $(echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$') = "n" ]]
			then
				string+=$( echo $line | grep -o '"response":"[^"]*' | grep -o '[^"]*$')
			else
				string+=" "
			fi
		done
		echo $string
		unset string
	else
		echo "Parameter missing"
	fi
}
###############################################################################

###############################################################################

# FUNCTION (works)
# fgit()
# fast-git named fgit includes git 'add .', 'commit -am' and 'push' in one command.
# Important: $* saves the quotes but prevents adding more parameters to the git function. You can use $1 instead.
#################

fgit()
{
    git add .
    git commit -a -m "$*"
    git push
}
###############################################################################
# FUNCTION (works) ch() for copy_histroy()
# ch()
# grep the history and copy the last line to the clipboard
#################

#ch()
#{
#   history 1 | rg $1 | tail -1 |  cut -d' ' -f4- | pbcopy
#}

###############################################################################
# FUNCTION (works) geth() for get_histroy()
# geth()
# grep the history and echo it into the history-file
#################

geth()
{
    if [[ ! -z $1 ]] then
        #result=$(history 1 | rg "$1" | tail -1 | awk -F ' ' '{$1="";print $0}' | sed -e 's/^[ \t]*//')
        result=$(history 1 | awk -F ' ' '{$1="";print $0}' | rg "$1" | tail -1 | sed -e 's/^[ \t]*//')
        if [[ $result == "" ]]; then
            echo "No fitting entry in .zsh_history for \"$1\".";
        else
                     echo -e "The result is now in your .zsh_history (and clipboard). Press ENTER to reload it. Result:\n\n"
                     echo $result
                     echo $result | pbcopy
                     echo -e "\n"
                     echo ": $(date +%s):0;$result" >> /Users/peter/.zsh_history
        fi
    else
         echo "Parameter required to search for a command in your .zsh_history."
         echo "geth will search for a command \$1 by executing \"history 1 | awk -F ' ' '{\$1=\"\";print \$0}' | rg \$1 | tail -1 | sed -e 's/^[ \\\t]*//'\" and append it to your .zsh_history so that you can reuse it immediately."
    fi
}


###############################################################################
# FUNCTION cft() for check_file_type()
# check_file_type() $1=filename to check for
# check_file_type checks if file/dir exists and tells you whether it is a file or a directory.
#################

cft()
{
    if [[ -e $1 ]]
    then
        echo "$1 exists"

        if [[ -d $1 ]]
        then
            echo "$1 is a directory"
        fi

        if [[ -f $1 ]]
        then
            echo "$1 is a file"
        fi

    else
        echo "$1 doesnt exist"
    fi
}

###############################################################################
# FUNCTION (doesnt work)
# EchoEyeCatcher() $1=text to be echoed
#################

EchoEyeCatcher()
{
    # echo $1 Parameter in white font on red background
    echo -e '\E[37;41m' "$1"; tput sgr0;
}

###############################################################################
# FUNCTION (inside function EyeCatcher doesnt work)
# DoesDollarExist() $1=error-message, $2=var to be checked
#################

DoesDollarExist()
{
    # takes $1 as error-message
    # and $2 to check it (e.g. Port or Repo or message)
    if [[ ! -z $2 ]] then
        return 0; #yes, $2 exists
    else
        EchoEyeCatcher "$1";
        return 1; #no, $2 doesnt exist
    fi
}

###############################################################################
# FUNCTION
#4. IsPortFree() $1=port
#################

IsPortFree()
{
    CheckIfDollarExists "Port is missing in 'IsPortFree()'" $1 || return 1;
    #$1 needed a port
    fuser=$(/usr/sbin/fuser $1/tcp); #check if port is used by a process
    if [[ -z $fuser ]] then
        return 0; #yes, port is free because fuser output is empty
    elif [[ ! -z $fuser ]] then
        return 1; #no, port is not free because fuser output is not empty
    fi
}

###############################################################################
# FUNCTION
#1. ExitIfCodeIsNot0()
#########################

ExitIfCodeIsNot0()
{
    if [[ "$?" -eq 0 ]] then
        echo "Exit code is 0, good :)";
        return 0; #yes, last command worked
    else
        echo "Exit code is not 0, bad :(. Exit now.";
        exit;  #because last command didnt worked
    fi
}

###############################################################################

###############################################################################

###############################################################################

PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$HOME/.local/bin:$PATH"

#source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh




# for linux dev-env: GNUBINS="$(find `brew --prefix`/opt -type d -follow -name gnubin -print)"; for bindir in ${GNUBINS[@]}; do  export PATH=$bindir:$PATH ; done ; export PATH

#export JAVA_HOME="/usr/bin/java"

