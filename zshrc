# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# Change Your Cursor Shape on the Fly in Zsh’s "vi-mode"
# This comes after sourcing om-my-zsh, because we want to
# overrwite its version of the zle-keymap-select widget,
# and before sourcing Powerline, because it knows how to coexist
# with us.

# zle-keymap-select from the vi-mode plugin. 
# https://emily.st/2013/05/03/zsh-vi-cursor/
function change-cursor-shape {
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac
}
zle -N zle-line-init change-cursor-shape
zle -N zle-keymap-select change-cursor-shape

# Powerline must be activated after oh-my-zsh.sh because
# .oh-my-zsh/lib/theme-and-appearance.zsh stupidly sets a
# default prompt when no theme is specified, and because
# bindkey -v (set in plugin vi-mode) must be active before
# powerline builds the prompt

# enable vi mode (oh-my-zsh plugin vi-mode is incompatible with multi-line)
# powerline prompts, because the bootstrap script preserves a call to
# `zle reset-prompt` resulting in it being called twice, once by the vi-mode
# plugin and again by the powerline zle widget.
# bindkey -v

# ZLE_RPROMPT_INDENT=0 # buggy!
powerline-daemon -q
export POWERLINE_REPOSITORY_ROOT=$(python -c 'import powerline, os; print os.path.dirname(powerline.__file__)')
source "$POWERLINE_REPOSITORY_ROOT/bindings/zsh/powerline.zsh"

# push the prompt to the bottom of the screen
tput cup $(( LINES - 2 ))
# it would be better to have this in $PS1 if we could keep it
# from clearing the last line of stdout when we hade a multi-line
# prompt
# PS1='$(tput cup 25)'$PS1

# update timestamp every second
# TMOUT=1
# TRAPALRM() {
#     # unless we're in a PS2 continuation!
#     # for some reason the %_ global gets reset after zle-reset-prompt,
#     # causing PS2 to be redrawn with a blank prompt.
#     if [[ -z $PREBUFFER ]]; then
#         zle reset-prompt
#         zle -R
#     fi
# }

redraw_prompt () {
    local last_state=$?
    local full_PS1=$PS1

    # reset block cursor before entering e.g. another REPL
    # https://emily.st/2013/05/03/zsh-vi-cursor/ again
    print -n -- "\E]50;CursorShape=0\C-G"

    # redraw the prompt excluding the "above" segments before writing to
    # history
    # copied from powerline.zsh ll. 143-156
    local add_args='-r .zsh'
    add_args+=' --last-exit-code=$?'
    add_args+=' --last-pipe-status="$pipestatus"'
    add_args+=' --renderer-arg="client_id=$$"'
    add_args+=' --renderer-arg="shortened_path=${(%):-%~}"'
    add_args+=' --jobnum=$_POWERLINE_JOBNUM'
    add_args+=' --renderer-arg="mode=$_POWERLINE_MODE"'
    add_args+=' --renderer-arg="default_mode=$_POWERLINE_DEFAULT_MODE"'
    add_args+=' --width=$(( ${COLUMNS:-$(_powerline_columns_fallback)} - ${ZLE_RPROMPT_INDENT:-1} ))'
    PS1='$("$POWERLINE_COMMAND" $=POWERLINE_COMMAND_ARGS shell left '$add_args')'

    $(exit last_state)
    zle reset-prompt
    zle -R
    PS1=$full_PS1
}
zle -N zle-line-finish redraw_prompt

# Disable or reduce delay after sending "escape" code
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1

# iTerm2 shell integration
# https://www.iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.zsh