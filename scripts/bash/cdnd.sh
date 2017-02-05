# Author: Faylite
# Makes a directory and cd's into it
# Argument 1: Directory name
cdnd() {
	# If arguemnt 1 is empty or equals -h display help
	if [[ ( -z "$1" ) || ( "$1" == "-h" ) ]]
	then
		echo "Makes a directory and cd's into it"
	else
		mkdir $1 && cd $1
	fi
}
