#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias conf-i3='micro ~/.config/i3/config'
alias conf-polybar='micro ~/.config/polybar/config'
alias conf-picom='micro ~/.config/picom/picom.conf'
alias conf-rofi='micro ~/.config/rofi/config.rasi'
alias conf-bspwm='micro ~/.config/bspwm/bspwmrc'
alias conf-sxhkd='micro ~/.config/sxhkd/sxhkdrc'
alias conf-termite='micro ~/.config/termite/config'
PS1='[\u@\h \W]\$ '
