# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
PATH="/usr/local/sbin:$PATH"
eval "$(pyenv init -)"
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs context)
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='15' # white
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='4'  # dark blue
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='10' # bright green
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='2'  # dark green
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" $ "

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
# plugins=(vi-mode)
plugins=(git pyenv)

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



# # Change Your Cursor Shape on the Fly in Zsh’s "vi-mode"
# # This comes after sourcing om-my-zsh, because we want to
# # overrwite its version of the zle-keymap-select widget,
# # and before sourcing Powerline, because it knows how to coexist
# # with us.

# # escape the cursor control sequence for tmux, if necessary
# # c.f. vitality.vim

# function wrap-for-tmux {
#     local string=${1}
#     local tmux_start="\EPtmux;"
#     local tmux_end="\E\\"
#     local ESC="\E"
#     print -n -- $tmux_start${string//$ESC/$ESC$ESC}$tmux_end
# }
# cursor_block="\E]50;CursorShape=0\C-G"
# cursor_line="\E]50;CursorShape=1\C-G"
# if [[ -n $TMUX ]]; then
#     cursor_block=$(wrap-for-tmux $cursor_block)
#     cursor_line=$(wrap-for-tmux $cursor_line)
# fi

# # zle-keymap-select from the vi-mode plugin. 
# # https://emily.st/2013/05/03/zsh-vi-cursor/


# function change-cursor-shape {
#     # change cursor shape in iTerm2
#     if [[ -n $ITERM_PROFILE ]]; then
#         case $KEYMAP in
#             vicmd)      print -n -- $cursor_block;;  # block cursor
#             viins|main) print -n -- $cursor_line;;  # line cursor
#         esac
#     fi
# }
# zle -N zle-line-init change-cursor-shape
# zle -N zle-keymap-select change-cursor-shape

# # Powerline must be activated after oh-my-zsh.sh because
# # .oh-my-zsh/lib/theme-and-appearance.zsh stupidly sets a
# # default prompt when no theme is specified, and because
# # bindkey -v (set in plugin vi-mode) must be active before
# # powerline builds the prompt

# # ZLE_RPROMPT_INDENT=0 # buggy!
# powerline-daemon -q
# export POWERLINE_REPOSITORY_ROOT=$(python -c 'import powerline, os; print os.path.dirname(powerline.__file__)')
# source "$POWERLINE_REPOSITORY_ROOT/bindings/zsh/powerline.zsh"

# # push the prompt to the bottom of the screen
# tput cup $(( LINES - 2 ))
# # it would be better to have this in $PS1 if we could keep it
# # from clearing the last line of stdout when we hade a multi-line
# # prompt
# # PS1='$(tput cup 25)'$PS1

# # update timestamp every second
# TMOUT=1
# TRAPALRM() {
#     # unless we're in e.g. a PS2 continuation or a tab completion menu!
#     # for some reason the %_ global gets reset after zle-reset-prompt,
#     # causing PS2 to be redrawn with a blank prompt, and the menu of
#     # possible completions flickers when redrawn.
#     if [[ -z $PREBUFFER ]] && ! [[ "$WIDGET" =~ "complete" ]]; then
#         zle reset-prompt
#         zle -R
#     fi
# }

# redraw_prompt () {
#     local last_state=$?
#     local full_PS1=$PS1

#     # reset block cursor before entering e.g. another REPL
#     # https://emily.st/2013/05/03/zsh-vi-cursor/ again
#     if [[ -n $ITERM_PROFILE ]]; then
#         print -n -- $cursor_block
#     fi

#     # redraw the prompt excluding the "above" segments before writing to
#     # history
#     # copied from powerline.zsh ll. 143-156
#     local add_args='-r .zsh'
#     add_args+=' --last-exit-code=$?'
#     add_args+=' --last-pipe-status="$pipestatus"'
#     add_args+=' --renderer-arg="client_id=$$"'
#     add_args+=' --renderer-arg="shortened_path=${(%):-%~}"'
#     add_args+=' --jobnum=$_POWERLINE_JOBNUM'
#     add_args+=' --renderer-arg="mode=$_POWERLINE_MODE"'
#     add_args+=' --renderer-arg="default_mode=$_POWERLINE_DEFAULT_MODE"'
#     add_args+=' --width=$(( ${COLUMNS:-$(_powerline_columns_fallback)} - ${ZLE_RPROMPT_INDENT:-1} ))'
#     PS1='$("$POWERLINE_COMMAND" $=POWERLINE_COMMAND_ARGS shell left '$add_args')'

#     $(exit last_state)
#     zle reset-prompt
#     zle -R
#     PS1=$full_PS1
# }
# zle -N zle-line-finish redraw_prompt

# # Disable or reduce delay after sending "escape" code
# # https://www.johnhawthorn.com/2012/09/vi-escape-delays/
# KEYTIMEOUT=1

# # iTerm2 shell integration
# # https://www.iterm2.com/documentation-shell-integration.html
# source ~/.iterm2_shell_integration.zsh
