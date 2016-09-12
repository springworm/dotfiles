#aliases yay

alias ls='ls --color=auto --group-directories-first -X'
alias grep='grep --colour=auto'
alias sudo='sudo '
#alias pacman='pacmatic'
alias bc='bc -ql'
alias js='js17'
alias wifiwerk='if ping -c 1 -W 3 google.com &> /dev/null; then echo werks; else echo does not werk; sudo netctl restart "$(netctl list|sed "s/^* //")"; echo werks; fi'
alias get='find -name'
alias gambatte-sdl='gambatte-sdl -i return rshift x z up down left right'
PATH=$HOME/.config/bin:$PATH
PS1='\[\033[1;`[[ $? -eq 0 ]] && echo 35 || echo 31`m\]->\[\033[0m\] '
#PS1='\[\033[1;`[[ $? -eq 0 ]] && echo 35 || echo 31`m\]──╼\[\033[0m\] '
export EDITOR="vim"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export STEAM_RUNTIME=0
source /usr/share/doc/pkgfile/command-not-found.bash

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-chalk.light.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

  #OLD SETPROMPT
    #returned=$?
    #PS1='\[\033[01;36m\][`trimwd 3 "\`pwd\`" $HOME`]\
    #\[\033[1;31m\] \
    #\[\033[1;31m\]`if [ $returned != 0 ]; then echo "[$returned] "; fi;`\
    #\[\033[01;32m\]» \
    #\[\033[0;35m\]'

shopt -s extglob

note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch $HOME/.notes
    fi

    if [[ $# -eq 0 ]]; then
        # no arguments, print file
        cat $HOME/.notes
    elif [[ "$1" == "-c" ]]; then
        # clear file
        echo "" > $HOME/.notes
    else
        # add all arguments to file
        echo "$@" >> $HOME/.notes
    fi
}

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c='bsdtar xvf';;
            *.7z)  c='7z x';;
            *.Z)   c='uncompress';;
            *.bz2) c='bunzip2';;
            *.exe) c='cabextract';;
            *.gz)  c='gunzip';;
            *.rar) c='unrar x';;
            *.xz)  c='unxz';;
            *.zip) c='unzip';;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command $c "$i"
        e=$?
    done

    return $e
}

man() {
	env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;35m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;34m") \
	man "$@"
}

math() {
    bc <(echo -e "$@"\\nquit) 
}
