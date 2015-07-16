# Sources (natelandau.com/my-mac-osx-bash_profile/, github.com/mdo/config/blob/master/.bash_profile)

# Custom Bash Prompt (kirsle.net/wizards/ps1.html)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 5)\]⌘ \[$(tput setaf 6)\]\w/\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

# Set Paths
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/Cellar/qt5/5.4.2/bin:$PATH"

# Set Default Editor to Sublime Text
export EDITOR=/usr/local/bin/subl

# Improvements
# ============
alias ditto='cp -iv'                                   # Preferred 'cp' implementation
alias dittodir='cp -r'                                 # Preferred 'cp' dir implementation
alias mv='mv -iv'                                      # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                                # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                                  # Preferred 'ls' implementation
alias less='less -FSRXc'                               # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }                          # Always list directory contents upon 'cd'

# lr: Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# System Commands
# ===============
alias ~="cd ~"                                         # ~:      Go Home.
alias c='clear'                                        # c:      Clear terminal display.
alias f#='echo $(ls -1 | wc -l)'                       # f#:     Count of non-hidden files in current dir.
alias path='echo -e ${PATH//:/\\n}'                    # path:   Echo all executable Paths.
alias finder='open -a Finder ./'                       # finder: Opens current directory in Finder.
ql() { qlmanage -p "$*" >& /dev/null; }                # ql:     Opens any file in MacOS Quicklook Preview.
del() { command rm -rf "$@"; }                         # del:    Permanently deletes a file.
mkcd() { mkdir -p "$1" && cd "$1"; }                   # mkcd:   Makes new dir and jumps inside.
hide() { chflags hidden "$1"; }                        # hide:   Hide the file.
show() { chflags nohidden "$1"; }                      # show:   Show the file.
trash() { command mv "$@" ~/.Trash; }                  # trash:  Moves a file to the MacOS trash.
zipdir() { zip -r "$1".zip "$1" ; }                    # zipdir: To create a ZIP archive of a folder.
hidefiles() { defaults write com.apple.finder AppleShowAllFiles NO; killall Finder; }  # hidefiles: Hide hidden files in Finder.
showfiles() { defaults write com.apple.finder AppleShowAllFiles YES; killall Finder; } # showfiles: Show hidden files in Finder.
editbinary() { plutil -convert xml1 ${1} && subl ${1}; }                               # editbinary: Edit a binary file as xml.
convertbinary() { plutil -convert binary1 ${1}; }                                      # convertbinary: Convert a file to binary.

# extract: Extract most known archives with one command.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1    ;;
      *.tar.gz)  tar xzf $1    ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar e $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xf $1     ;;
      *.tbz2)    tar xjf $1    ;;
      *.tgz)     tar xzf $1    ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# App Commands
# ============
alias edit='subl'                                      # edit:  Opens any file in sublime editor.
alias sweep='~/Scripts/system/maintenance/sweep.sh' # sweep: Run upkeep tasks.
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'   # vlc:   VLC media player.

# Internet Commands
# =================
alias myip='curl ip.appspot.com'                       # myip:      Public facing IP Address
alias flushdns='dscacheutil -flushcache'               # flushdns:  Flush out the DNS Cache
alias openports='sudo lsof -i | grep LISTEN'           # openports: All listening connections

# internet: display useful host related informaton
internet() {
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
# ===============
alias hosts='subl /etc/hosts'                          # hosts:     Edit system hosts file
alias dreamhost='ssh netbasis@butternut.dreamhost.com' # dreamhost: Connect to DreamHost
# httpdebug:  Download a web page and show info on what took time
httpdebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }