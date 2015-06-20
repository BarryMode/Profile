# Sources: natelandau.com/my-mac-osx-bash_profile/
#          github.com/mdo/config/blob/master/.bash_profile

# Custom Bash Prompt (kirsle.net/wizards/ps1.html)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 5)\]⌘ \[$(tput setaf 6)\]\w/\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

# Set Paths
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Set Default Editor to Sublime Text
export EDITOR=/usr/local/bin/subl

# Terminal Improvements
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'

# Basic Commands
alias edit='subl'                               # edit:       Opens any file in sublime editor.
alias f='open -a Finder ./'                     # f:          Opens current directory in Finder.
alias ~="cd ~"                                  # ~:          Go Home.
alias c='clear'                                 # c:          Clear terminal display.
alias path='echo -e ${PATH//:/\\n}'             # path:       Echo all executable Paths.
alias eject='/usr/bin/drutil eject'             # eject:      Force eject disc.
alias empty='rm -rf ~/.Trash/*'                 # empty:      Empty the trash.
alias update='softwareupdate -ia'               # update:     Installs OS X software updates.
alias repair='diskutil repairPermissions /'     # repair:     Repair disk permissions.
mcd() { mkdir -p "$1" && cd "$1"; }             # mcd:        Makes new Dir and jumps inside.
trash() { command mv "$@" ~/.Trash ; }          # trash:      Moves a file to the MacOS trash.
delete() { command rm -rf "$@" ; }              # delete:     Permanently deletes a file.
quicklook() { qlmanage -p "$*" >& /dev/null; }  # quicklook:  Opens any file in MacOS Quicklook Preview.
zipfolder () { zip -r "$1".zip "$1" ; }         # zipfolder:  To create a ZIP archive of a folder.
alias numFiles='echo $(ls -1 | wc -l)'          # numFiles:   Count of non-hidden files in current dir.

# finderShowHidden:  Show hidden files in Finder
# finderHideHidden:  Hide hidden files in Finder
alias showHiddenFiles='defaults write com.apple.finder ShowAllFiles TRUE'
alias hideHiddenFiles='defaults write com.apple.finder ShowAllFiles FALSE'

# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# extract:  Extract most known archives with one command.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# spotlight:  Search for a file using MacOS Spotlight's metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# Networking Commands
alias myip='curl ip.appspot.com'                # myip:       Public facing IP Address
alias flushDNS='dscacheutil -flushcache'        # flushDNS:   Flush out the DNS Cache
alias openPorts='sudo lsof -i | grep LISTEN'    # openPorts:  All listening connections

# ii:  display useful host related informaton
ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ;myip
  echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

# Web Development
alias editHosts='edit /etc/hosts'                        # editHosts:  Edit /etc/hosts file
# httpDebug:  Download a web page and show info on what took time
httpDebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }