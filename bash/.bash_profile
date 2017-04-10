# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

cd ~/workspace/printerlogic-com
source ~/workspace/printerlogic-com/venv-printerlogic/bin/activate

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
