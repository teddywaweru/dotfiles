# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -e $HOME/.config/zsh/zshconfig ]]; then
  source $HOME/.config/zsh/zshconfig
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $HOME/.config/zsh/.p10k.zsh ]] || source $HOME/.config/zsh/.p10k.zsh


export EDITOR="usr/bin/nvim"
alias v='nvim'
alias cls="clear"
alias z='zellij'
alias t='tmux'
alias c='clear'
alias vf="vifm"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.config/.dotfiles --work-tree=$HOME/.config"
alias xx_files="/usr/bin/git --git-dir=$HOME/dev/make-files/.cfg --work-tree=$HOME/dev/make-files/.cfg"
alias la="ls -alh"

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

