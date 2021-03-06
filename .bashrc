# PERSONAL $HOME/.bashrc FILE

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#--------------------------------------
# Load environment settings on startup
#--------------------------------------
source /etc/environment


#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

#-------------------------------------------------------------
# Import aliases
#-------------------------------------------------------------

if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases   
fi

#--------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already).
# This works for me - your mileage may vary. . . .
# The problem is that different types of terminals give
# different answers to 'who am i' (rxvt in particular can be
# troublesome) - however this code seems to work in a majority
# of cases.
#--------------------------------------------------------------

function get_xserver ()
{
    case $TERM in
        xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            #  I_AM=$(who am i)
            #  SERVER=${I_AM#*(}
            #  SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
        aterm | rxvt)
            # Find some code that works here. ...
            ;;
    esac
}

if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) ||
       ${XSERVER} == "unix" ]]; then
          DISPLAY=":0.0"          # Display on local host.
    else
       DISPLAY=${XSERVER}:0.0     # Display on remote host.
    fi
fi

export DISPLAY

#-------------------------------------------------------------
# Import settings
#-------------------------------------------------------------

if [ -f ~/.bash_settings ]; then
      . ~/.bash_settings   
fi

#-------------------------------------------------------------
# Import colors
#-------------------------------------------------------------

if [ -f ~/.bash_colors ]; then
      . ~/.bash_colors   
fi

#-------------------------------------------------------------
# Dircolors
#-------------------------------------------------------------

if [ -f ~/.dircolors ]; then
  . ~/.dircolors
fi

#-------------------------------------------------------------
# Color palette
#-------------------------------------------------------------

INFO=${BBlack}${On_White}     # Bold Black on white background
WARN=${BRed}${On_White}       # Bold Red on white background
ALERT=${BWhite}${On_Red}      # Bold White on red background

GR_FLAG=${BWhite}${On_Green}  # Bold White on green background
YL_FLAG=${BBlack}${On_Yellow} # Bold Black on yellow background
#YL_FLAG=${Black}${On_Yellow} # Bold Black on yellow background
OR_FLAG=${BWhite}${On_Orange} # Bold White on orange background
RD_FLAG=${BRed}${On_White}    # Bold Red on white background
WT_FLAG=${BBlack}${On_White}  # Bold Black on white background

UUB=${Blue}${On_Black}
ON_UUB=${Black}${On_Blue}
TRUNKS=${Green}${On_Black}
ON_TRUNKS=${Black}${On_Green}
GOKU=${Orange}${On_Black}
ON_GOKU=${Black}${On_Orange}
CLAYTON=${Lilac}${On_Black}
ON_CLAYTON=${Black}${On_Lilac}

HOST_MACHINE=$(eval "echo \$${HOSTNAME^^}")
ON_HOST_MACHINE=$(eval "echo \$ON_${HOSTNAME^^}")

#-------------------------------------------------------------
# MOTD
#-------------------------------------------------------------

echo -e "${HOST_MACHINE}${Bold} ${HOSTNAME^^}! ${HOST_MACHINE}\n\
 BASH ${BRed}${BASH_VERSION%.*}${HOST_MACHINE} DISPLAY ${BRed}$DISPLAY \n\
 ${HOST_MACHINE}$(df -Ph "$PWD" | \
  awk 'END {print "Available disk space: " $4 " " "Used: " $5}') ${NC}\n"


#-------------------------------------------------------------
# Import Fancy PS1
#-------------------------------------------------------------

if [ -f ~/.bash_prompt ]; then
      . ~/.bash_prompt   
fi

# ----------------
# Add bin/ to path
# ----------------
PATH=$PATH:/home/jim/bin

#---------------------
# Add snap/bin to path
#---------------------
PATH=$PATH:/snap/bin

#-----------------------
# Setup virtualenvwrapper
#-----------------------
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source /home/jim/.local/bin/virtualenvwrapper.sh


#----------------------
# Add ActiveTcl to path
#----------------------
export PATH="/opt/ActiveTcl-8.6/bin:$PATH"

#-------------------------------------------------------------
# Exit shell function
#-------------------------------------------------------------

function _exit()
{
    echo -e "${BRed}Come back soon!${NC}"
}
trap _exit EXIT

