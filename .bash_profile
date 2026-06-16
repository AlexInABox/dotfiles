# .bash_profile - You are who people think you are

# MacOS apparently ignores all bash standards and only sources this file
# So we just source .profile ourselves :shrug:
if [ -f ~/.profile ]; then
	. ~/.profile
fi
