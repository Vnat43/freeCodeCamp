#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

#user login
if [[ -z $USER_ID ]]
then 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = '$USER_ID'" | sed 's/^[ \t]*//;s/[ \t]*$//')
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = '$USER_ID'" | sed 's/^[ \t]*//;s/[ \t]*$//')
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(($RANDOM % 1000 + 1))
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1

until [[ $SECRET_NUMBER == $GUESS ]]
do
  #if guess not int
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
    if [[ $SECRET_NUMBER > $GUESS ]]
    then
      echo "It's higher than that, guess again:"
    else 
      echo "It's lower than that, guess again:"
    fi
  fi
  read GUESS
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_GAME=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($NUMBER_OF_GUESSES, $USER_ID)")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
UPDATE_USER_BEST_GAME=$($PSQL "UPDATE users SET best_game = $BEST_GAME WHERE user_id = $USER_ID")
GAMES_PLAYED=$(($GAMES_PLAYED + 1))
UPDATE_USER_GAME_COUNT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")
