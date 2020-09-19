# Path to your oh-my-zsh installation.
export ZSH=/Users/shubham/.oh-my-zsh

ZSH_THEME="cobalt2"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

autoload -U compinit && compinit

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

hour=`date +"%T"`
hour=${hour%%:*}
if [ "$hour" -lt 12 ]
then
  echo "Good morning, Shubham."
elif [ "$hour" -ge 12 -a "$hour" -lt 17 ]
then
  echo "Good Afternoon, Shubham."
else
  echo "Good Evening, Shubham."
fi

echo "----------------------------------------"
motivate
echo "----------------------------------------"

echo "Current time: `date +"%r %a %d %h %y"`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOPATH=~/projects/go
export PATH=~/.rbenv/shims:${GOPATH}/bin:/usr/local/Cellar/python/3.7.4/bin/:/opt/apache-maven-3.6.3/bin/:$PATH

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --border'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
                 killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;
                 killall Finder /System/Library/CoreServices/Finder.app'

export HISTFILE=~/dotfiles/backup_files/.zsh_history

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

alias cat='bat'
alias help='tldr'

# make less interesting with syntax highlighting
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
alias more='less'
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
# export PATH="/usr/local/opt/helm@2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shubham/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shubham/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shubham/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shubham/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$PATH:$HOME/.istioctl/bin
