# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -e $HOME/.config/zsh/zshconfig ]]; then
  source $HOME/.config/zsh/zshconfig
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# source $HOME/.config/zsh/p10k/powerlevel10k.zsh-theme
# [[ ! -f $HOME/.config/zsh/p10k/.p10k.zsh ]] || source $HOME/.config/zsh/p10k/.p10k.zsh



eval "$(starship init zsh)"
