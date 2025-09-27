# .profile - Are you living in the real world?

# This makes shell applications like "tabby" also apply the .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Load environment variables from .bash_env if it exists
if [ -f ~/.bash_env ]; then
	. ~/.bash_env
fi

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
