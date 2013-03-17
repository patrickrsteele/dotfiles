# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Turn off the touchpad
synclient TouchpadOff=1

# Turn on the touchpad
#synclient TouchpadOff=0

# Color codes
# Black       0;30	Dark Gray		1;30
# Blue        0;34	Light Blue		1;34
# Green       0;32	Light Green		1;32
# Cyan        0;36	Light Cyan		1;36
# Red         0;31	Light Red		1;31
# Purple      0;35	Light Purple		1;35
# Brown       0;33	Yellow			1;33
# Light Gray  0;37	White			1;37
# Dark grey	90	Dark grey background	100
# Light red	91	Light red background	101
# Light green	92	Light green background	102
# Yellow	93	Yellow background	103
# Light blue	94	Light blue background	104
# Light purple	95	Light purple background	105
# Turquoise	96	Turquoise background	106
# White		97	


# PS1 Appearance

black='\[\e[0;30m\]'
dgray='\[\e[0;90m\]'
blue='\[\e[0;34m\]'
lblue='\[\e[1;34m\]'
green='\[\e[0;32m\]'
lgreen='\[\e[1;32m\]'
cyan='\[\e[0;36m\]'
lcyan='\[\e[1;36m\]'
red='\[\e[0;31m\]'
lred='\[\e[1;31m\]'
purple='\[\e[0;35m\]'
lpurple='\[\e[1;35m\]'
brown='\[\e[0;33m\]'
yellow='\[\e[0;33m\]'
lgray='\[\e[0;37m\]'
white='\[\e[0;97m\]'
NC='\[\e[0m\]'

usercolor=${cyan}
hostcolor=${cyan}
timecolor=${green}
dircolor=${green}
sepcolor=${purple}

PS1="${timecolor}\t \`date '+%a %d %b %Y'\` ${sepcolor}[${dircolor}\w${sepcolor}]\n${usercolor}\u${sepcolor}@${hostcolor}\h ${sepcolor}\$ ${NC}"

# Read and update history after every command; useful when working
# with multiple terminal windows
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

# Aliases
alias ls='ls --color'
alias ll='ls -l'

# Fix Matlab version compatibility issue
alias matlab='matlab -glnx86'

# Export LaTeX environment variables to include ~/share as a search path for packages
export TEXINPUTS=".:~/share//:"
export BIBINPUTS=".:~/share//:"

# Help Python find local modules
export PYTHONPATH="./:/home/prsteele/share//:"

# Make emacs the default git editor
export GIT_EDITOR="emacs -Q"

# Add local executables to the path
export PATH=$PATH":~/bin"

# Suppose the GO language
export GOPATH="/home/prsteele/local/go"

# Bind CAPSLOCK to CTRL
/usr/bin/setxkbmap -option "ctrl:nocaps"
