
#!/usr/bin/env bash



#### Colors	########################################################################################################

NC='\033[0m' 		# No Color
GRE='\033[0;32m'	# Green
RED='\033[0;31m'	# RED
CYA='\033[0;36m'	# Cyan

######################################################################################################## Colors ####

# Win / Draw / Lost messages	# emoji from https://looks.wtf/happy
win=$(echo  -e ${GRE}"You WON \033[5m ٩(^ᴗ^)۶  \033[0m \n")
draw=$(echo  -e ${CYA}"It's a DRAW \033[5m¯\_(ツ)_/¯ \033[0m \n")
lose=$(echo  -e ${RED}"You LOST \033[5m(╯°□°)╯︵ ┻━┻ \033[0m \n")
line=$(echo -e ${LPUR}----------------------------------------------${NC})

# declare counters for win / draw / lose / number of played games
declare -i user_wins=0
declare -i bot_wins=0
declare -i draw_game=0
declare -i game=0
declare -i play=1

# declare avaiable choices
declare -a choice; choice=("Rock" "Paper" "Scissors")

# game loop
while [[ ${play} =~ "1" ]]
do
# generate User and Bot Random number & Bot Choice
 bselect=$(( $RANDOM % 3 ))		# generate random number 1-3
 uselect=$(( $RANDOM % 3 ))		# generate random number 1-3
 bot=(${choice[$bselect]})		# generate random bot choice

# User input of choice
printf "\nmake your choice: (${GRE}R${NC}ock ${GRE}P${NC}aper ${GRE}S${NC}cissors ${RED}Q${LRED}uit${NC}) ${PUR}"; read user
printf "${NC} \n"

# capitalize user input "example: rock > Rock"
user="$(tr '[:lower:]' '[:upper:]' <<< ${user:0:1})${user:1}"

# check:  if user input is [R / P / S / Q] then converts it to full words [Rock / Paper / Scissors / Quit]
	if [[  $user == "R"  ]]; then
		user=Rock
	elif [[  $user == "P"  ]]; then
		user=Paper
	elif [[  $user == "S"  ]]; then
		user=Scissors
	elif [[  $user == "Q"  ]]; then
		user=Quit
	fi

# check:  if user input is empty then autogenerate user input form game choice
 	if [ -z "${user}" ]; then
 		user=(${choice[$uselect]})
 	fi

# check if user input is valid [Rock / Paper / Scissors] and if true incement number of played games and display user/bot input
	if [[ " ${choice[*]} " =~ " ${user} " ]]; then
		((game=game+1))

		echo "You: ${user}"
		echo "Bot: ${bot}"
		printf "${NC} \n\n"

	fi


# Quit game and displays game score
if [  $user == "Quit"  ]; then

#	printf "Number  of  played  games: ${CYA}${game}${NC}\n Wins (${GRE}${user_wins}${NC}) Draw (${CYA}${draw_game}${NC}) Lost (${RED}${bot_wins}${NC})" | cowsay


#	printf "Number  of  played  games: ${CYA}${game}${NC}\n Wins (${GRE}${user_wins}${NC})      | \n Draw (${CYA}${draw_game}${NC})      | \n Lost (${RED}${bot_wins}${NC})" | cowsay


	printf "Number  of  played  games: ${CYA}${game}${NC} \n Wins (${GRE}${user_wins}${NC}) \n Draw (${CYA}${draw_game}${NC}) \n Lost (${RED}${bot_wins}${NC})" | cowsay



		break
	fi


# compare user and bot input and decide if user won/draw/lost
	if [[ $user =~ "Rock" ]] && [[ $bot =~ "Scissors" ]] ; then
		echo $win; echo $line
			((user_wins=user_wins+1))

	elif [[ $user =~ "Paper" ]] && [[ $bot =~ "Rock" ]] ; then
		echo $win; echo $line
			((user_wins=user_wins+1))

	elif [[ $user =~ "Scissors" ]] && [[ $bot =~ "Paper" ]] ; then
		echo $win; echo $line
			((user_wins=user_wins+1))

	elif [[ $user = $bot ]] ; then
		echo $draw; echo $line
			((draw_game=draw_game+1))

	elif [[ $user =~ "Scissors" ]] && [[ $bot =~ "Rock" ]] ; then
		echo $lose; echo $line
			((bot_wins=bot_wins+1))

	elif [[ $user =~ "Rock" ]] && [[ $bot =~ "Paper" ]] ; then
		echo $lose; echo $line
			((bot_wins=bot_wins+1))

	elif [[ $user =~ "Paper" ]] && [[ $bot =~ "Scissors" ]] ; then
		echo $lose; echo $line
			((bot_wins=bot_wins+1))

	else
		echo -e "${RED}\033[5mDetected invalid input \033[0m"
		echo -e "Please enter the correct input [ ${GRE}R${NC} / ${GRE}P${NC} / ${GRE}S${NC} / ${GRE}Rock${NC} / ${GRE}Paper${NC} / ${GRE}Scissors${NC} / ${RED}Q${NC} for exiting game]${NC}"

	fi

done





