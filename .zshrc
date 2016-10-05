# Path to your oh-my-zsh installation.
export ZSH=/Users/shubham/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='mvim'

. `brew --prefix`/etc/profile.d/z.sh
export PATH="/Users/shubham/anaconda2/bin:$PATH"
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
