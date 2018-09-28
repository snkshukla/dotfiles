# Path to your oh-my-zsh installation.
export ZSH=/Users/shubham/.oh-my-zsh

ZSH_THEME="cobalt2"
COMPLETION_WAITING_DOTS="true"
plugins=(git docker-rails zsh-autosuggestions short-dir zsh-completions)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

autoload -U compinit && compinit

#. `brew --prefix`/etc/profile.d/z.sh
# export PATH="/Users/shubham/anaconda2/bin:$PATH"
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
fortune -s
echo "----------------------------------------"

echo "Current time: `date +"%r %a %d %h %y"`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOPATH=~/projects/go
export PATH=~/.rbenv/shims:/usr/local/go/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES;
                 killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO;
                 killall Finder /System/Library/CoreServices/Finder.app'
