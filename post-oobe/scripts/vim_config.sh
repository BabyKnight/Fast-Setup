#!/bin/bash

TEMP_CONFIG="~/vimrc"


# Create the target configuration file
#touch $TEMP_CONFIG

# Define items
function Interactive (){
		echo "Test !>>"
		QUESTION=$1
		CONFIG=$2
		#echo "q is $QUESTION"
		#echo "setting is $CONFIG"
		#read -p "$QUESTION [\033[32mY\033[0m/N]"
		read -p "$QUESTION [Y/N]: " choice
		if [[ "$choice" == "Y" || "$choice" == "y" ]] ; then
				#echo $CONFIG >> $TEMP_CONFIG
				echo -e "Configuring [\033[32m '$CONFIG' \033[0m"
				echo $CONFIG
		else
				echo "Ignore settings of \'$CONFIG\'"
		fi
}

#Define items
# show number of line
PROMPT="Show numnber of line?"
SETTING="set nu!"
$(Interactive "$PROMPT" "$SETTING")
#`Interactive "$PROMPT" "$SETTING"`

# Highlight the line in position of cursor
PROMPT="Highlight the line in position cursor?"
SETTING="set cul"
$(Interactive "$PROMPT" "$SETTING")
#`Interactive "$PROMPT" "$SETTING"`



