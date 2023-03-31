import mysql.connector, re, time
from mysql.connector import errorcode

# Code is based upon 'cars database' from Code Workshop, written by Ilir Jusufi
# Connecting to the mysql socket in MAMP
cnx = mysql.connector.connect(user='root',
                              password='root',
                              host='127.0.0.1',
                              unix_socket= '/Applications/MAMP/tmp/mysql/mysql.sock',
                              )
                              
DB_NAME = 'quaketournamentsdb'
cursor = cnx.cursor()

# Read the lines from the database dump file
dumpfile = open('quaketournamentsdb.sql')
sqlLines = dumpfile.read()



# This function creates the database
def create_database(cursor, DB_NAME):
    try:
        cursor.execute(
            "CREATE DATABASE {} DEFAULT CHARACTER SET 'utf8'".format(DB_NAME))
    except mysql.connector.Error as err:
        print("Failed creating database: {}".format(err))
        exit(1)


def playerSubMenu(cursor):
  while(True):

    print(" Display results based on:\n",
          "1. Players who has achieved first place in a tournament and their respective Tournament Wins\n",
          "2. Players who belong to an association\n",
          "3. View players who have earned over amount of prize money\n",
          "4. Sort players based on Age\n",
          "5. Count number of first place wins for each player\n",
          "'r'. Return to main menu")  

    user_input = input()


    if user_input == '1':
        query = "SELECT player.name, player.player_nickname, tournament.game, tournament.date, tournament.name FROM players player INNER JOIN results result ON result.first_place = player.players_id INNER JOIN tournaments tournament ON result.tournament_id = tournament.tournament_id"
        cursor.execute(query)
        for (playerName, playerNickname, tournamentGame, tournamentDate, tournamentName) in cursor:
          print("Name: {} Nickname: {}".format(playerName, playerNickname))
          print("Game: {} Date: {} Tournament: {}".format(tournamentGame,tournamentDate,tournamentName))
          print("\n---")

    if user_input == '2':
      print("Enter association")

      try:
        user_input2 = input()
        query = "SELECT players.name, players.age, players.player_nickname, players.country, players.earnings FROM players WHERE players.association LIKE '{}'".format(user_input2)
        cursor.execute(query)

        print("Players who belong to {} association: ".format(user_input2))
        for (name, age, player_nickname, country, earnings) in cursor:
          print("---")
          print("Name: {}\n Nickname: {}\n Age: {}\n Country: {}\n Earnings: ${}".format(name,player_nickname,age,country,earnings))
          print("---\n")
      except Exception as err:
        print(err)

      pass

    if user_input == '3':
      try:
        print("Enter a positive value:")
        chosenEarnings = int(input())
        
        if chosenEarnings >= 0:
          query = "SELECT players.name, players.player_nickname ,players.age, players.country, players.status, players.earnings FROM players WHERE players.earnings >= {}".format(chosenEarnings)
          cursor.execute(query)

          for (playerName, playerAge, player_nickname, playerCountry, playerStatus, playerEarnings) in cursor:
            print("---")
            print("Name: {}\n Nickname: {}\n Age: {}\n Country: {}\n Status: {}\n Earnings: ${}".format(playerName, playerAge, player_nickname, playerCountry, playerStatus, playerEarnings))
            print("---\n")
        else:
          print("Input has to be positive")

      except Exception as error:
        print(error)


    if user_input == '4':
      isExec = False
      print( "1. View the oldest Player\n",
             "2. View the youngest Player\n",
             "3. View Average Age of a Player\n")

      user_input2 = input()

      
      if user_input2 == '1':
        aggregationFunction = "MAX(players.age)"
        isExec = True

      if user_input2 == '2':
        aggregationFunction = "MIN(players.age)"
        isExec = True
      
      
      if user_input2 == '3':
        query = "SELECT AVG(players.age) FROM players"
        cursor.execute(query)
        isExec = True
      
      if isExec and user_input2 == '3':
    
        for table in cursor:
          for age in table:
            print("The average age is: {}".format(age))

      # If the user chose MAX or MIN age, create a new query containing the specific aggregation function they've chosen.
      elif isExec:
        query =  "SELECT name, player_nickname, age, country, earnings FROM players WHERE age = (SELECT {} FROM players)".format(aggregationFunction)
        cursor.execute(query)
        
        for (name, nickname, age, country, earnings) in cursor:
          print("Name: {:<10} Nickname: {:<5} Age: {} Country: {:<2} Earnings: ${:<2}".format(name, nickname,age,country,earnings))


    if user_input == '5':
      query = "SELECT player.name, player.player_nickname, COUNT(result.first_place = player.players_id) FROM players player INNER JOIN results result ON result.first_place = player.players_id GROUP BY player.players_id"
      cursor.execute(query)

      for (playerName, player_nickname, playerWins) in cursor:
        print("Name {:<20} Player Nickname: {:<9} Number of first place wins: {}\n".format(playerName,player_nickname, playerWins))
    if user_input == 'r':
      return ''

    # Exit the main loop, stop execution of the program.
    if user_input == 'q':
      return 'q'


# Try to use the Database, and if it does not exist it shall create one with the name 'DB_NAME'
try:
    cursor.execute("USE {}".format(DB_NAME))
    print("Database '{}' already installed".format(DB_NAME))
except mysql.connector.Error as error:
    print("Database {} does not exists.".format(DB_NAME))           # If the database does not exist, we create it and fill it with the sql dump data
    if error.errno == errorcode.ER_BAD_DB_ERROR:
        create_database(cursor, DB_NAME)
        print("Database {} created successfully.".format(DB_NAME))
        cnx.database = DB_NAME

    for result in cursor.execute(sqlLines, multi=True):
      if result.with_rows:
        print("Rows produced by statement '{}':".format(
          result.statement))
        print(result.fetchall())
      else:
        print("Number of rows affected by statement '{}': {}".format(result.statement, result.rowcount))

user_input = 'run'

while (user_input != 'q'):
  print(" 1. List all players \n",         
        "2. List all tournaments\n",
        "3. Display Information of Tournament\n",
        "4. List the active players\n",
        "5. List players on Condition\n",
        "'q': To exit Application")

  user_input = input()


  if user_input == '1':
    try:
      query = "CREATE OR REPLACE VIEW playerview AS SELECT name,player_nickname FROM players"
      cursor.execute(query)
      query = "SELECT * FROM playerview"
      cursor.execute(query)
      print("Executing query")
      for (name,player_nickname) in cursor:
          print("Real name: {:<24} Nickname: {}".format(name,player_nickname))
    except Exception as err:
      print("Something went wrong", err)
    input("Press any key to continue")

  if user_input == '2':
    try:
      query = "SELECT NAME, DATE FROM tournaments"
      cursor.execute(query)
      for (name, date) in cursor:
        print("Name: {:<62} Date: {}\n".format(name,date))
    except Exception as err:
      print("Something went wrong", err)
    input("Press any key to continue")
  
  if user_input == '3':
    userTournament = input("Input name of Tournament") 

    if len(userTournament) > 0:
      tournamentDetails_query = 'SELECT tournaments.tournament_id, tournaments.name, tournaments.date, tournaments.game, tournaments.country_location, tournaments.prize_pool FROM tournaments WHERE tournaments.name LIKE "{}"'.format(userTournament)
      try:

        cursor.execute(tournamentDetails_query)

        for (id, name, date, game, country, prize_pool) in cursor:
          
          tournamentResults_query = "SELECT results.first_place, results.second_place, results.third_place, results.fourth_place, results.fifth_place FROM results WHERE results.tournament_id = {}".format(id)
          print("Tournament: {} Date: {} Game: {} Country: {} Prize Pool: ${}".format(name,date,game,country,prize_pool))
          cursor.execute(tournamentResults_query)
          print("\n")
          break

        placement = 1
        for (table) in cursor:

          for id in table:
            playerInfoQuery = "SELECT players.name, players.player_nickname, players.age FROM players WHERE players.players_id = {}".format(id)
            cursor.execute(playerInfoQuery)
            for (name, nickname, age) in cursor:
              print("Placment: {:<3} Name: {:<18} Nickname: {:<10} Age: {}\n".format(placement,name, nickname, age))
              placement+=1

      except Exception as err:
        print(err)

    input("Press any key to continue")

  if user_input == '4':
    query = "SELECT players.name, players.player_nickname, players.age, players.association, players.earnings FROM players WHERE players.status LIKE 'Active'"

    cursor.execute(query)
    for (name, nickname, age, association, earnings) in cursor:
      if age is None:
        age = "NA"
      if association is None:
        association = "NA"
      print("Name: {:<20} Nickname: {:<8}  Age: {:<5} Assocation: {:<18} Earnings: ${:<4}\n".format(name, nickname, age, association, earnings))

  if user_input == '5':
    user_input = playerSubMenu(cursor)

# Close the connections when the application is exited.
cursor.close()
cnx.close()
