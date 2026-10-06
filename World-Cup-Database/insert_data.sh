#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TRUNCATE_DATA=$($PSQL "TRUNCATE TABLE games, teams")

FILE='games.csv'

cat $FILE | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #insert into teams table
  if [[ $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
  then 
    IS_WINNER_TEAM_KNOWN=$($PSQL "SELECT COUNT(*) FROM teams WHERE name = '$WINNER'")
    #if winner team is not in teams
    if [[ $IS_WINNER_TEAM_KNOWN == 0 ]]
    then
      #add winner in teams table
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo -e "Winner inserted: $WINNER"
    fi

    IS_OPPONENT_TEAM_KNOWN=$($PSQL "SELECT COUNT(*) FROM teams WHERE name = '$OPPONENT'")
    #if winner team is not in teams
    if [[ $IS_OPPONENT_TEAM_KNOWN == 0 ]]
    then
      #add winner in teams table
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo -e "Opponent inserted: $OPPONENT"
    fi
  fi

  #insert into games table
  if [[ $YEAR != 'year' && $ROUND != 'round' && $WINNER_GOALS != 'winner_goals' && $OPPONENT_GOALS != 'opponent_goals' ]]
  then 
    #get winner and opponent_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #add game in games table
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo -e "Game inserted"
  fi
done
