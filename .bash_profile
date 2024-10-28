# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -a | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        eval $(ssh-agent -s)
   fi
fi

#if [ -z "$SSH_AUTH_SOCK" ]; then
#   # Check for a currently running instance of the agent
#   RUNNING_AGENT="`ps -a | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
#   if [ "$RUNNING_AGENT" = "0" ]; then
#        # Launch a new instance of the agent
#        ssh-agent -s &> $HOME/.ssh/ssh-agent
#   fi
#   eval `cat $HOME/.ssh/ssh-agent` &> /dev/null
#fi

export GH_TOKEN=`gh auth token`

for host in id_rsa; do
    ssh-add ~/.ssh/${host} &> /dev/null
done
export GH_TOKEN=$(gh auth token)
