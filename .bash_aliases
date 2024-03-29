#-------------------
# Personal Aliases
#-------------------

# Prevent accidentally clobbering files.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

#alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Abbreviate useful history lookup
alias hg='history | grep'

alias o='xdg-open'

alias cls='clear'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -1hB --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -tr'         #  Sort by date, most recent last.
alias llt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
# alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...


#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
#export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
export LESS='-i -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#-------------------------------------------------------------
# make directory and cd into it
#-------------------------------------------------------------

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\"";
}

#-------------------------------------------------------------
# shortcuts to key directories
#-------------------------------------------------------------
alias cdmmt='cd ~/Documents/mmt'
alias cdrepos='cd ~/Documents/repos'
alias cdd='cd ~/Documents/mmt/daily-notes'
alias cdbooks='cd ~/Documents/books'
alias cdperl='cd ~/Documents/projects/learn-perl'
alias cdreport='cd ~/Documents/projects/auto-completion-reports'
alias cdprojects='cd ~/Documents/projects'
alias cdbash='cd ~/Documents/repos/bash-dot-files'
alias cdch='cd ~/Documents/chinese'

#-------------------------------------------------------------
# realias
#-------------------------------------------------------------
alias realias='$EDITOR ~/.bash_aliases; source ~/.bash_aliases'

#-------------------------------------------------------------
# Obsidian
#-------------------------------------------------------------
alias obs='nohup Obsidian-0.8.0.AppImage & 2> /dev/null; exit;'

#-------------------------------------------------------------
# Anki
#-------------------------------------------------------------
alias anki='nohup ~/bin/anki-2.1.33-linux-amd64/bin/anki & 2> /dev/null; exit;'

#-------------------------------------------------------------
# Pinyin-writer
#-------------------------------------------------------------
alias pn='python3 ~/Documents/projects/python-projects/pinyin-writer-02/pinyinwriter.py'

#-------------------------------------------------------------
# Bitwarden
#-------------------------------------------------------------
alias bitw='nohup Bitwarden-1.24.6-x86_64.AppImage & 2> /dev/null; exit;'

#----------
# IBM Cloud
#----------
alias ibm='ibmcloud'
