export ZSH="/home/prsteele/.oh-my-zsh"

ZSH_THEME="ys"

# export TERM=rxvt-unicode-256color

plugins=(git z zsh-dircolors-solarized)

source $ZSH/oh-my-zsh.sh

if [[ $TERM = dumb ]]; then
    unset zle_bracketed_paste
fi

export EDITOR='emacsclient'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

export PATH=/home/prsteele/.local/bin:$PATH

# Support pyenv
export PYENV_ROOT=/home/prsteele/lib/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# Support virtualenvwrapper
export WORKON_HOME=/home/prsteele/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/home/prsteele/.local/pipx/venvs/virtualenvwrapper/bin/python
export VIRTUALENVWRAPPER_SCRIPT=virtualenvwrapper.sh
source virtualenvwrapper_lazy.sh

# # Support ghcup
# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"


# Auto-complete
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

if [ -e /home/prsteele/.nix-profile/etc/profile.d/nix.sh ]; then . /home/prsteele/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
