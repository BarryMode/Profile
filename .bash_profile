# Custom Bash Prompt (kirsle.net/wizards/ps1.html)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 5)\]⌘ \[$(tput setaf 6)\]\w/\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"