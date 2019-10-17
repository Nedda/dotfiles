# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/namini/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_181`
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

PATH=$PATH:/Users/namini/bin:/Users/namini/work/bin:/Users/namini/work/software/bin

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alia ohmyzsh="mate ~/.oh-my-zsh"

ssh-add ~/.ssh/testing-20180808.pem

aws-developer() {
  local account="838594874642"
  local role="arn:aws:iam::${account}:role/cjorganization/CJDeveloperAccessRole"
  local mfa_serial="arn:aws:iam::597974043991:mfa/namini@cj.com"
  local mfa_token="$1"

  eval "$(aws --profile voltron sts assume-role \
    --role-arn "$role" \
    --role-session-name "bootstrap$$" \
    --serial-number "$mfa_serial" \
    --token-code "$mfa_token" \
    --duration-seconds 43200 \
    --query \
       'Credentials |
          join (`\n`,
           values({
             AccessKeyId: join(``, [`export AWS_ACCESS_KEY_ID=`,AccessKeyId]),
             SecretAccessKey:join(``, [`export AWS_SECRET_ACCESS_KEY=`,SecretAccessKey]),
             SessionToken:join(``, [`export AWS_SESSION_TOKEN=`,SessionToken])
           }))' \
    --output text)"
}

# prompt_segment() {
#   [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
#   [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
#   if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
#     print -n "%{$SEGMENT_SEPARATOR%{$fg%}"
#   else
#     print -n "%{$bg%}%{$fg%}"
#   fi
#   CURRENT_BG=$1
#   [[ -n $3 ]] && print -n $3
# }

# prompt_dir() {
#   prompt_segment blue black "%2~"
# }

alias deps="mvn clean install -Pdeps -DskipTests=true -Dcleanup.skip=true -Ddelta.skip=true -Dtablespaces.skip=true"
alias omfg='mvn -T 1C -Dqunit.mThreads=8 -DskipTests -Dcleanup.skip=true -Ddelta.skip=true -Dtablespaces.skip=true -Dgulp.task=min clean install'
alias omfglite='mvn -T 1C -Dqunit.mThreads=8 -Dcleanup.skip=true -Ddelta.skip=true -Dtablespaces.skip=true -Dgulp.task=min package'

alias dbstart='nohup VBoxHeadless --startvm "Oracle11g32" &> /dev/null &'
alias dbstop='VBoxManage controlvm Oracle11g32 poweroff'

alias mw='cd ~/work/main/cjo/member-web'
alias wipeout='wget http://build.dev.cj.com/job/main/13397/consoleText'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PROMPT='$(prompt_dir)'

