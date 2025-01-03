# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

if [[ -e $HOME/.config/zsh/zshconfig ]]; then
  source $HOME/.config/zsh/zshconfig
fi

# TODO Separate file for plugin configuration
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
function zvm_after_init() {
	# Shell Integrations for fzf, which conflict with vi-mode keybindings
	# TODO Looks very misplaced here.... May be better to have as blanket implementation
	# of tasks to run after all plugins have been loaded?
	source <(fzf --zsh)
}
zvm_after_init_commands+=( zvm_after_init )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# source $HOME/.config/zsh/p10k/powerlevel10k.zsh-theme
# [[ ! -f $HOME/.config/zsh/p10k/.p10k.zsh ]] || source $HOME/.config/zsh/p10k/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
