# Author: Faylite
# Counts lines of code in a file
# Argument 1: Filename
# Argument 2: Output
count-loc() {
	# If arguemnt 1 is empty or equals -h, or argument 2 equals -h, display help
	if [[ ( -z "$1" ) || ( "$1" == "-h" ) || ( "$2" == "-h" ) ]]
	then
		echo Counts lines of code in a file
		echo Parameters: 
		echo -t 		Return only the total lines of code in all files found
		echo -a -A		Return the total lines of code in all files individually and the total
		echo -h			Shows this help menu
		echo Example: 
		echo count-loc *.FileExt -t
		return
	fi

	if [[ ( -z "$2" ) || ( "$2" == "-t" ) ]]
	then
		( find ./ -name $1 -print0 | xargs -0 cat ) | wc -l
	fi
	
	if [[ ( "$2" == "-a") || ( "$2" == "-A" ) ]]
	then
		find . -name '*.cs' | xargs wc -l
	fi
}
