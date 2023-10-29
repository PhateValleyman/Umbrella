#!/system/bin/bash
function mkcd {
	last=$(eval "echo \$$#")
	if [ ! -n "$last" ]; then
		echo "Enter a directory name"
	elif [ -d $last ]; then
		echo "\`$last' already exists"
	else
		mkdir $@ && cd $last
	fi
}
