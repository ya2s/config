ZIM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zim"
ZIM_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/zimrc"

# pure prompt colors (primer dark)
zstyle ':prompt:pure:path' color '#B7BDC8'
zstyle ':prompt:pure:git:branch' color '#656C76'
zstyle ':prompt:pure:git:dirty' color '#D29922'
zstyle ':prompt:pure:git:arrow' color '#4493F8'
zstyle ':prompt:pure:git:stash' color '#656C76'
zstyle ':prompt:pure:git:action' color '#F85149'
zstyle ':prompt:pure:prompt:success' color '#4493F8'
zstyle ':prompt:pure:prompt:error' color '#F85149'
zstyle ':prompt:pure:host' color '#656C76'
zstyle ':prompt:pure:user' color '#656C76'
zstyle ':prompt:pure:virtualenv' color '#656C76'
zstyle ':prompt:pure:prompt:continuation' color '#3D444D'
zstyle ':prompt:pure:execution_time' color '#656C76'

if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Manual module loading (instead of init.zsh) for deferred syntax highlighting
if [[ -e ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]] zimfw() { source "${ZIM_HOME}/zimfw.zsh" "${@}" }
fpath=("${ZIM_HOME}/modules/zsh-completions/src" ${fpath})
source "${ZIM_HOME}/modules/pure/async.zsh"
# Stub 'who' during pure init to skip slow SSH detection (~270ms)
who() { return 1; }
source "${ZIM_HOME}/modules/pure/pure.zsh"
unfunction who
source "${ZIM_HOME}/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Show git repo name instead of full path (e.g. "newt/src" instead of "~/.ghq/.../newt/src")
PROMPT=${PROMPT/'%~'/'%21v'}
_prompt_git_root=
_prompt_path_chpwd() {
  _prompt_git_root=
  local dir=$PWD
  while [[ $dir != "/" ]]; do
    if [[ -e "$dir/.git" ]]; then
      _prompt_git_root=$dir
      return
    fi
    dir=${dir:h}
  done
}
_prompt_path_precmd() {
  if [[ -n $_prompt_git_root ]]; then
    psvar[21]="${_prompt_git_root:h:t}/${_prompt_git_root:t}${PWD#$_prompt_git_root}"
  else
    psvar[21]="${(%):-%~}"
  fi
}
add-zsh-hook chpwd _prompt_path_chpwd
add-zsh-hook precmd _prompt_path_precmd
_prompt_path_chpwd

# Defer fast-syntax-highlighting until first keystroke (~550ms saved from startup)
_deferred_fsh() {
  source "${ZIM_HOME}/modules/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
  add-zle-hook-widget -d line-init _deferred_fsh
}
add-zle-hook-widget line-init _deferred_fsh

# Optimized compinit: full rebuild only if dump is missing or >20h old
() {
  setopt LOCAL_OPTIONS EXTENDED_GLOB
  autoload -Uz compinit
  local zdumpfile=${ZDOTDIR:-${HOME}}/.zcompdump
  if [[ ! -e $zdumpfile ]] || [[ -n $zdumpfile(#qN.mh+20) ]]; then
    compinit -d "$zdumpfile"
    zcompile "$zdumpfile"
  else
    compinit -C -d "$zdumpfile"
  fi
}

# Completion settings (from zimfw completion module)
setopt ALWAYS_TO_END COMPLETE_IN_WORD NO_CASE_GLOB NO_LIST_BEEP
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+r:|[._-]=* r:|=*' '+l:|=*'
zstyle ':completion:*' insert-tab false
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'
zstyle ':completion:*:default' list-colors ${(s.:.):-di=1;34:ln=35:so=32:pi=33:ex=31:bd=1;36:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43}
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
