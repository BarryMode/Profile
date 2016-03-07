# Custom Bash Prompt (kirsle.net/wizards/ps1.html)
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 5)\]⌘ \[$(tput setaf 6)\]\w/\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

# Set Paths
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/git/bin:/sw/bin:/usr/local/bin:/usr/local:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/Cellar/qt5/5.5.0_1/bin:$PATH"

# Set Default Editor to Sublime Text
export EDITOR=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin

# Improvements
# ============
alias mv='mv -iv'                                      # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                                # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                                  # Preferred 'ls' implementation
alias less='less -FSRXc'                               # Preferred 'less' implementation
alias wget='wget -c'                                   # Preferred 'wget' implementation
cd() { builtin cd "$@"; ls; }                          # Always list directory contents upon 'cd'

# lr: Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# System Commands
# ===============
alias ~='cd ~'                                         # ~:      Go Home.
alias c='clear'                                        # c:      Clear terminal display.
alias f#='echo $(ls -1 | wc -l)'                       # f#:     Count of non-hidden files in current dir.
alias path='echo -e ${PATH//:/\\n}'                    # path:   Echo all executable Paths.
alias finder='open -a Finder ./'                       # finder: Opens current directory in Finder.
alias delemptydir='find . -type d -empty -delete'      # delemptydir: Delete all empty subdirectories.
ql() { qlmanage -p "$*" >& /dev/null; }                # ql:     Opens any file in MacOS Quicklook Preview.
del() { command rm -rf "@"; }                          # del:    Permanently deletes a file.
burn() { drutil burn "$1"; }                           # burn:   Burns file to inserted disc.
mkcd() { mkdir -p "$1" && cd "$1"; }                   # mkcd:   Makes new dir and jumps inside.
hide() { chflags hidden "$1"; }                        # hide:   Hide the file.
show() { chflags nohidden "$1"; }                      # show:   Show the file.
trash() { command mv "$@" ~/.Trash; }                  # trash:  Moves a file to the MacOS trash.
zipdir() { zip -r "$1".zip "$1"; }                    # zipdir: To create a ZIP archive of a folder.
hidefiles() { defaults write com.apple.finder AppleShowAllFiles NO; killall Finder; }  # hidefiles: Hide hidden files in Finder.
showfiles() { defaults write com.apple.finder AppleShowAllFiles YES; killall Finder; } # showfiles: Show hidden files in Finder.

# find-replace: Example - find-replace searchText replacementText
find-replace() { ack "$1" -la --print0 | xargs -0 -n 1 sed -i "s/$1/$2/"; }

# extract: Extract most known archives with one command.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xvjf $1    ;;
      *.tar.gz)   tar xvzf $1    ;;
      *.tar.xz)   tar xvJf $1    ;;
      *.lzma)     unlzma $1      ;;
      *.bz2)      bunzip2 $1     ;;
      *.rar)      unrar x -ad $1 ;;
      *.gz)       gunzip $1      ;;
      *.tar)      tar xvf $1     ;;
      *.tbz2)     tar xvjf $1    ;;
      *.tgz)      tar xvzf $1    ;;
      *.zip)      unzip $1       ;;
      *.Z)        uncompress $1  ;;
      *.7z)       7z x $1        ;;
      *.xz)       unxz $1        ;;
      *.exe)      cabextract $1  ;;
      *)          echo "extract: '$1' - unknown archive method" ;;
    esac
  else
    echo "$1 - file does not exist"
  fi
}

# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# App Commands
# ============
alias r34='~/Websites/^/rule34/grabber/rule34.sh'      # r34:     Does what it says.
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'   # vlc:     Adds input to VLC media player playlist.
alias edit='subl'                                      # edit:    Opens any file in Sublime Text.
alias eject='~/Code/Bash/OSX/eject-super-drive.sh'     # eject:   Eject the super drive.
alias sweep='~/Code/Bash/OSX/sweep.sh'                 # sweep:   Runs upkeep tasks.
alias update='~/Code/Bash/OSX/install-updates.sh'      # update:  Install updates.
alias grabber='open ~/Websites/^/rule34/grabber/Grabber.app' # grabber: Opens Grabber.
alias settings='subl ~/.bash_profile'                  # settings: Bash profile location.
alias vget='youtube-dl'                                # vget: Alias for youtube-dl.

# youtube: Download playlist with youtube-dl.
vget-playlist() { youtube-dl -o '%(playlist)s/%(title)s.%(ext)s' "$1"; }
# mget: Download music with youtube-dl.
mget() { youtube-dl --extract-audio --audio-format mp3 -l "$1"; }
# remux: Ex. "remux mkv" would remux all mkvs to mp4.
remux() { for i in *."$1"; do ffmpeg -i "$i" -codec copy "${i/${i##*.}/mp4}"; done }

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
alias dreamhost='ssh netbasis@goodlife.dreamhost.com' # dreamhost: Connect to DreamHost
alias adler='ssh admin@192.168.1.8' # nas server

# httpdebug:  Download a web page and show info on what took time
httpdebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }