#!/bin/bash

TEMP_CONFIG="~/vimrc"
USE_DEFAULT=1


# Create the target configuration file
#touch $TEMP_CONFIG

# Define function whether using default template
function use_default (){
	read -p "Skip setting up vim by using default settings [Y/n]: " skip_to_use_default
	# set default value when press enter without any input
	if [ -z "${skip_to_use_default}" ];then
		skip_to_use_default="Y"
	fi

	if [[ "$skip_to_use_default" == "Y" || "$skip_to_use_default" == "y" ]]; then
		USE_DEFAULT=1
	else
		USE_DEFAULT=0
	fi
}


# Define items
function Interactive (){
	QUESTION=$1
	CONFIG=$2
	read -p "$QUESTION [Y/n]: " choice
	# set default value when press enter without any input
	if [ -z "${choice}" ];then
		choice="Y"
	fi

	if [[ "$choice" == "Y" || "$choice" == "y" ]] ; then
		#echo $CONFIG >> $TEMP_CONFIG
		echo -e "Configuring \033[32m '$CONFIG' \033[0m"
		# TODO print the config first, will write to file later
		echo $CONFIG
	else
		echo "Ignore settings of '$CONFIG'"
	fi
}

# confirm if igonre set by using default
use_default
echo $USE_DEFAULT

if [ "$USE_EDFAULT" -eq 1 ]; then
	# TODO copy file
	echo "Copying default settings to [.vimrc]"
else
	#Define items
	# show number of line
	PROMPT="Show numnber of line?"
	SETTING="set nu!"
	Interactive "$PROMPT" "$SETTING"
	
	# Highlight the line in position of cursor
	PROMPT="Highlight the line in position cursor?"
	SETTING="set cul"
	Interactive "$PROMPT" "$SETTING"
fi



