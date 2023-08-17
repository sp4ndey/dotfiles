# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh
__git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh
git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet --short HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi

  if [[ -n "$ref" ]]; then
    # echo " \u29FC%{$fg[cyan]%}$ref%{$reset_color%} \u29FD"
    echo " \u27E8%{$fg[cyan]%}$ref%{$reset_color%}\u27E9"
  fi
}
