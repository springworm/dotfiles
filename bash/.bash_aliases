alias igrep="grep -i"
alias xclip="xclip -sel c"
alias bc="bc -ql"
alias open="xdg-open"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# container magic
alias docker="sudo -u docker docker"
alias drun="docker run -it --rm"
alias k="sudo -u docker minikube kubectl --"
alias mk="sudo -u docker minikube"

cl() {
	cd $@ && ls
}

cm() {
	mkdir -p $@ && cd $@ && ls
}

# vim: set ft=bash :
