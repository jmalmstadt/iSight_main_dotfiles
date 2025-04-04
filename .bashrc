# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias up='nvm use && make docker-up'
alias down='nvm use && make docker-down'
alias wa='nvm use && make watch'
alias st='nvm use && node server'
alias bdsu='nvm use && make breakdown setup && make create-sample-users'
alias migrate='nvm use && make migrate'
alias ip='nvm install && nvm use && yarn --frozen-lockfile && yarn unlink && yarn link'
alias ic='nvm install && nvm use && yarn --frozen-lockfile && yarn link isight'
alias ipv5='nvm install && nvm use && npm install && yarn unlink && yarn link'
alias icv5='nvm install && nvm use && npm install && yarn link isight'
alias ms='docker run -d -p 1080:1080 -p 1025:1025 maildev/maildev'

export SOURCE_MAP=true
export FLAG_LIMIT=20
export FIELD_LIMIT=1000
export FIELD_WARNING_LIMIT=750
export PICKLIST_ITEM_LIMIT=10000
export PICKLIST_ITEM_WARNING_LIMIT=7500
export RESTRICT_EDIT_FIELD_LIMIT=80

export SAMPLE_PASSWORD=123456
export ES_HEAP_SIZE=16g

export POSTGRES_PASSWORD=${DB_PASS:-postgres}
export POSTGRES_HOST_AUTH_METHOD=trust

export ENABLE_TWO_WAY_PORTAL=true
export ENABLE_PORTAL=true
export NODE_ENV=development
export DISABLE_DB_BACKUP=true
export DISABLE_ES_SNAPSHOT=true
export SLEEP_TIME=0
export ALLOWED_REFERERS=true
export DISABLE_SECURE_COOKIES=true
export YF_ENABLED=false
export FORCE_ESCALATION_DELAY=1000
export DEV_SERVER=true
export ES_USER=elasticcd
export ES_PASS=changeme
export SOURCE_MAP=1
export DB_USER=postgres
export DB_HOST=0.0.0.0
export DB_PASS=postgres
export AUDIT_DB_PASS=postgres
export FILESTORE_DB_PASS=postgres
export QUARTZ_DB_PASS=postgres
export APP_CONFIG_PATH=/workspaces/config_johnson_v5
# FOR make retore tag
export DB_DATA=/workspaces/isight_main_v5_beta
# FOR v8.4+
export DISABLE_CONFIG_BACKUP=true
alias expath='export APP_CONFIG_PATH=$(pwd)'
#MAIL enivrontment variables for maildev
export MAIL_OVERRIDE_RECIP=jmalmstadt@caseiq.com
export MAIL_ENABLED=true
export MAIL_PORT=1025
export MAIL_DISABLE_STARTTLS=true
export MAIL_IGNORE_TLS=true
export MAIL_HOST=0.0.0.0
export MAIL_DISABLE_DNS_VALID=1
export MAIL_TRANSPORT=smtp
export MAILSRV_PORT=2525
export MAILSRV_DOMAIN=localhost.local

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# bash theme - partly inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme
__bash_prompt() {
    local userpart='`export XIT=$? \
        && [ ! -z "${GITHUB_USER}" ] && echo -n "\[\033[0;32m\]@${GITHUB_USER} " || echo -n "\[\033[0;32m\]\u " \
        && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local gitbranch='`\
        if [ "$(git config --get devcontainers-theme.hide-status 2>/dev/null)" != 1 ] && [ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ]; then \
            export BRANCH=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null); \
            if [ "${BRANCH}" != "" ]; then \
                echo -n "\[\033[0;36m\](\[\033[1;31m\]${BRANCH}" \
                && if [ "$(git config --get devcontainers-theme.show-dirty 2>/dev/null)" = 1 ] && \
                    git --no-optional-locks ls-files --error-unmatch -m --directory --no-empty-directory -o --exclude-standard ":/*" > /dev/null 2>&1; then \
                        echo -n " \[\033[1;33m\]✗"; \
                fi \
                && echo -n "\[\033[0;36m\]) "; \
            fi; \
        fi`'
    local lightblue='\[\033[1;34m\]'
    local removecolor='\[\033[0m\]'
    PS1="${userpart} ${lightblue}\w ${gitbranch}${removecolor}\$ "
    unset -f __bash_prompt
}
__bash_prompt
export PROMPT_DIRTRIM=4
