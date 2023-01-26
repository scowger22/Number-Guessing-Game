#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# randomly generate number
RANDOM_NUMBER=$($PSQL "SELECT floor(random() * (1000 - 1 + 1) + 1)::int as random_number")

GET_USER() {
# ask user for username
echo "Enter your username:"
read USERNAME

# look for user in database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

# if not found
if [[ -z $USER_ID ]]
 then 
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
# if found 
  else 
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name = '$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

PLAY_GAME
}


PLAY_GAME() {
# increment games played
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE name='$USERNAME'")

echo -e "\nGuess the secret number between 1 and 1000:" 
read GUESS
GUESSED='false'
NUMBER_OF_GUESSES=0

# while loop asks for input until user guesses the number
while [[ $GUESSED == 'false' ]]
do
# increment the number of guesses
let "NUMBER_OF_GUESSES+=1"
# checks that input was a number
if [[ $GUESS =~ ^[0-9]+$ ]]
then 
# if number is too high
if [[ $GUESS > $RANDOM_NUMBER ]]
then 
  echo -e "\nIt's lower than that, guess again:"
  read GUESS
# if number is too low
elif [[ $GUESS < $RANDOM_NUMBER ]]
then 
  echo -e "\nIt's higher than that, guess again:"
  read GUESS
# if user guesses the correct number
elif [[ $GUESS = $RANDOM_NUMBER ]]
then
  GUESSED='true'
  # check previous low score
  PREVIOUS_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")
  # if users first game
  if [[ -z $PREVIOUS_BEST_GAME ]]
  then
  INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE name='$USERNAME'")
  elif [[ $NUMBER_OF_GUESSES < $PREVIOUS_BEST_GAME ]]
  then
  INSERT_NEW_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE name='$USERNAME'")
  fi
  echo -e "\nYou guessed it in $(echo $NUMBER_OF_GUESSES | sed -E 's/ *$|^ *//g') tries. The secret number was $(echo $RANDOM_NUMBER | sed -E 's/ *$|^ *//g'). Nice job!"
  exit
fi
# input was not a number
else
  echo -e "\nThat is not an integer, guess again:"
  read GUESS
fi
done
}

GET_USER
