function _fzf_history() {
    local tmpf=$(mktemp) histf=$(mktemp)
    fc -rln 1 | awk '!a[$0]++' > "$histf"
    tmux display-popup -E -w 80% -h 70% "fzf +s < ${histf} > ${tmpf}"
    [[ -s $tmpf ]] && BUFFER=$(<"$tmpf")
    CURSOR=$#BUFFER
    rm -f "$tmpf" "$histf"
}
zle     -N   _fzf_history
bindkey '^R' _fzf_history

function _fzf_ghq() {
  local root=~/.ghq
  local tmpf=$(mktemp) listf=$(mktemp)
  local -a dirs=( ${root}/*/*/*(/N) )
  print -l ${dirs#${root}/} > "$listf"
  tmux display-popup -E -w 80% -h 70% \
    "fzf --query=${(qq)LBUFFER} < ${listf} > ${tmpf}"
  local selected_dir
  [[ -s $tmpf ]] && selected_dir=$(<"$tmpf")
  rm -f "$tmpf" "$listf"
  if [[ -n "$selected_dir" ]]; then
    BUFFER="cd ${root}/${selected_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N _fzf_ghq
bindkey "^G" _fzf_ghq
