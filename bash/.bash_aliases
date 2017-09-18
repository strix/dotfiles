alias djpl='cd ~/workspace/printerlogic-com && source venv-printerlogic/bin/activate'
alias pl='cd ~/workspace/printerlogic-com'
alias runs='python manage.py runserver 127.0.0.1:8000'
alias runss='python manage.py runserver_plus 127.0.0.1:8000 --cert cert'
alias collstat='python manage.py collectstatic -l'
alias sshpl='ssh printerl@printerlogic.com -p 2200'
alias sshplr='ssh -p 2200 root@printerlogic.com'
alias sshcc='ssh jarrett88@chorechartmonkey.com'
alias manshell='python manage.py shell'
alias testemail='python -m smtpd -n -c DebuggingServer localhost:1025'
alias fixhdmiaudio='speaker-test -c 2 -r 48000 -D hw:0,3'
alias gitgraph='git log --oneline --graph --decorate'
alias countfiles='find -maxdepth 1 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" -type f | wc -l; done'
alias pgoog='ping www.google.com'
alias demosite='ngrok http 127.0.0.1:8000'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias h='history'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias refresh='source ~/.bashrc'
alias genpass='date +%s | sha256sum | base64 | head -c 32 ; echo'
alias dhupdate='cd /home/branceboren/workspace/devhumor-slack && node devhumor.js'
alias gv='gvim --remote-silent'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'

# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

function largefiles {
  if [ -z "$1" ]; then
    echo "Usage: largefiles {directory path}"
  else
    du -ah $1 | sort -n -r | head -n 10
  fi
}

function spotdl {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: spotdl {spotify_song_id} (can be retrieved from spotify URI)"
  else
    $HOME/workspace/spotify-dl/spotify-dl.py --track $1 --dl youtube
  fi
}

function songdl {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: dlsong {youtube link}"
  else
    youtube-dl --extract-audio --audio-format mp3 $1
  fi
}

function plrsync {
  if [ -z "$1" ] && [ -z "$2" ]; then
    # display usage if both parameters not given
    echo "Usage: plrsync src dest"
  else
    rsync -avz --progress -e "ssh -p 2200" $1 $2
  fi
}

# GIT ALIASES
alias g='git status'
alias gu='git status -uno'
alias gh='git hist'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gpp='git pull --rebase && git push'
alias gf='git fetch'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gcv='git commit --no-verify'
alias gd='git diff --color-words'
alias gdc='git diff --cached -w'
alias gdw='git diff --no-ext-diff --word-diff'
alias gdv='git diff'
alias gl='git log --oneline --decorate'
alias gt='git tag'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gsl='git stash list'
alias gss='git stash save'
alias gcontrib='git shortlog -s -n --all'

function gitpullall {
  for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`; do
    git branch --track ${branch##*/} $branch
  done
}
