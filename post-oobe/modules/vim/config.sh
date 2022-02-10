#!/bin/bash

TARGET_CONFIG=~/.vimrc
USE_DEFAULT=1

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
		echo -e "Configuring \033[32m $CONFIG \033[0m"
		# TODO print the config first, will write to file later
		echo $CONFIG
	else
		echo "Ignore settings of $CONFIG"
	fi
}

# Step 1: select using default or config manually
# confirm if igonre set by using default
use_default

if [ "$USE_DEFAULT" -eq 1 ]; then
	echo "Copying default settings to [~/.vimrc]"
	cp vimrc.default $TARGET_CONFIG
else
	# Step 2: check if .vimrc already exist at home directory, create if not exist
	# check if .vimrc exist on user home directory
	if [ ! -f $TARGET_CONFIG ]; then
			echo ".vimrc file NOT found at home directory"
			echo "Creating ~/.vimrc ..."
			touch ~/.vimrc
	else
			echo ".vimrc file found at home directory"
	fi

	# Step 3: manually config by selecting each items
	#Define items
	# show number of line
	PROMPT="Show numnber of line?"
	SETTING="set nu!"
	Interactive "$PROMPT" "$SETTING"
	
	# Highlight the line in position of cursor
	PROMPT="Highlight the line in position cursor?"
	SETTING="set cul"
	Interactive "$PROMPT" "$SETTING"

	# show line info in status bar
	PROMPT="show line info in status bar"
	SETTING="set ruler"
	Interactive "$PROMPT" "$SETTING"

	# highlight the search result when do search
	PROMPT="highlight the search result when do search"
	SETTING="set hlsearch"
	Interactive "$PROMPT" "$SETTING"

	# when searching, jump to the match result when typing each character
	PROMPT="when searching, jump to the match result when typing each character"
	SETTING="set incsearch"
	Interactive "$PROMPT" "$SETTING"

	# set tab to 4 Space 
	PROMPT="set tab to 4 Space "
	SETTING="set ts=4"
	Interactive "$PROMPT" "$SETTING"

	# convert tab to Space
	PROMPT="convert tab to Space"
	SETTING="set expandtab"
	Interactive "$PROMPT" "$SETTING"

	# when press ENTER, indent for next line will keep the same as previous line
	PROMPT="when press ENTER, indent for next line will keep the same as previous line"
	SETTING="set autoindent"
	Interactive "$PROMPT" "$SETTING"

	# smart indent, e.g. C lauguage will auto indent when jump to next line
	PROMPT="smart indent, e.g. C lauguage will auto indent when jump to next line"
	SETTING="set smartindent "
	Interactive "$PROMPT" "$SETTING"

	# enable file type detect and enable specific indent 
	PROMPT="enable file type detect and enable specific indent "
	SETTING="filetype indent on"
	Interactive "$PROMPT" "$SETTING"

	# whenn input an left brackets, auto match right brackets
	PROMPT="whenn input an left brackets, auto match right brackets"
	SETTING="set showmatch"
	Interactive "$PROMPT" "$SETTING"

	# highlight syntax
	PROMPT="highlight syntax"
	SETTING="syntax on"
	Interactive "$PROMPT" "$SETTING"

	# when press TAB, vim wil show number of SPACE
	PROMPT="when press TAB, vim wil show number of SPACE"
	SETTING="set tabstop=2"
	Interactive "$PROMPT" "$SETTING"

	# press >> will increase indent, << wil decrease indent, == will cancel all indent
	PROMPT="press >> will increase indent, << wil decrease indent, == will cancel all indent"
	SETTING="set shiftwidth=4"
	Interactive "$PROMPT" "$SETTING"

	# enable color 256
	PROMPT="enable color 256"
	SETTING="set t_Co=256"
	Interactive "$PROMPT" "$SETTING"
fi
