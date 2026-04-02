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

source ${ZIM_HOME}/init.zsh
