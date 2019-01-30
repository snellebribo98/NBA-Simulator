# day 1 (wednesday)
I started working on the app at the end of the holiday. Made some screens, and experimenten with ways to implement user login-in/register. I will continue doing that later. Today I made sure that 2 of the 4 API's I'm going to use are in my app. I decided to load and proces all the data in de modesVC and not in the views that it is actually used. The player stats view will have the player ratings. Those ratings are needed for the team rating in the team view, and those team ratings are needed in the simulator view. So by making sure all the ratings are already made by the data that is loaded, all the views that come after simply just have to show them, since the views that show the player and team ratings are not connected to each other and the modesVC "connects" them.


# day 2 (thursday)
I started working on the 2 API's I already loaded. First the team API, I build a loop that if the team in the API is an NBA Franchise, append it to the list of NBA teams I made. For the players I made 2 lists to append to. One for the players itself and one for the playerID's. Those ID's are in the playerstats url itself, thus needing it to load that API. 

I made a for loop in the playerstats API to load all playerID url's. Making a list for playerStats, while loading the API it appends to that list each time it loops through the playerID list.


# dat 3. (friday)
Today I prepared the Player API and the Team API, to show them in a table view. This is not something special. I made a prepare through the tab bar controller, to the right navigation controller. Tada, all the NBA players and NBA teams were shown in two seperate table views, but most of the teams and players were shown double... I found out I loaded the players/teams from the NBA season, NBA Summer Leage and the NBA Africa game. I simply just had to load the NBA Season (standard) from those API's and the problem was fixed.

For the NBA teams I made a view controller after the table view that shows the team details of the clicked NBA team. 


# day 4 (monday)
Today I started working on the schedule API. I struggled all day to load it, because the API had some stupid variable names such as 'is' or 'as' and I couldn't figure out how get around this. After a day struggling I did something smart, I looked up if the information of those variables where needed for my app. The answer was no... thus solving the problem.


# day 5 (tuesday)
I wanted to show that my NBA Playerstats API is loading, since the app crashes if the user clicks on buttons while the API is still being loaded. It takes about 15 seconds for all the API's located in the modesVC to be loaded. 

Another thing I wanted to do today is a completion to make sure the playerstats API is loaded after the player API is loaded. Before this I used a sleep of about 3 seconds. Inorder to fix this I made a completion to fix this. After this I wanted to show the API's were still loading. For this I used a activity indicator and while it shows, disables all user interactions. I decided to start this while the player API starts loading. Not before the team API since it is so small and loads very quick, it doesn't need to be put infront. I put the end of the activity indicator inside my playerstats API, but that didn't work since it is a for-loop, so after one playerstats was loaded it would end. For this is made a completion handler inside the previous mentioned completion handler. So as soon as the playerstats is loaded completely it would end the activity indicator and thus enables the user to interact again. To know when the playerstats API is fully loaded I made an if statement that if the current number of loops is equal to the idList (- 1), the playerstats loading is complete. 

After this I took a quick look at the simulator. I made a picker with two variables to choose (two NBA teams) and the selected teams are prepared to show on the next view (that will show the simulated score eventually).

# day 6 (wednesday)
Found some code on the internet that shows you the current date aswell as the date of yesterday and tomorrow. I can use this with my schedule API to determine which games have passed (and give score points to users) and to determine which game is today, so users can choose the team to win.

I made a completion for the teams aswell (so a completion in a completion in a completion) so that the teams will be loaded with their teamID, then the players are loaded with their teamID so I can create the roster for all NBA teams, and then the stats are loaded with the playerID's retrieved from the player API.

Loading the leaderboard API takes a few seconds, so just to be save I made the same completion with interactions disables as with the other 3 API's

Hardcoded my simulator today. Added the score simulator. Implemented a randomizer for the home team score and away team score. The randomizer's minimum is the lowest rating of overall, defensive or offensive and the same counts for the randomizer's upperbound. For the home team there is a (4 in 5)^2 change to have an advantage over the away team, but there is a (1 in 5)^2 change that the away team blows the home team out, or the home team simply sucks.

# day 7 (thursday)
I restructered my data today. First I made an empty list in my team struct to load the players there, then I made an empty list in the player struct to load the playerstats there. Furthermore I made my simulator almost complete, first it was hardcoded and now it isn't.

# day 8 (friday)
Was sick.

# day 9 (monday)
Todat I finished my simulator. When you went to the simulatorVC it didn't show the team the picker was one (no stats, and no image of the team) and I struggled to fix this problem. Eventuely I made sure the labels (and with it the images) are updates as soon as the vc is loaded. Another problem was that the simulated results are calculated as soon as the vc is loaded, I fixed this problem by calling the function again if the simulate button is clicked. Another problem was that with the restructuring of my data, the team pickerview was not working anymore (the teams werent shown). Since the teamdetailss is a dict and the team name is in the value, I had to extract the team name from the dict in one of the pickerview functions (title for row) to get a team name to be shown in the pickerview and show the correct image. I made a for loop to get the team name value and appended it to a team home and away list.

# day 10 (tuesday)
Today I made a button at the team detail vc that leads to the roster of that specific team. Made to new tableview to show the players from that team and connected the players with the player detail vc. I expected troubles with connecting 2 tableviews to 1 viewcontroller, for instance: clicking on a player cell in roster tableview --> getting in the view controller of that player and click "back" --> end up in the other tableview with all the players. But it turned out that that isn't the case and xcode/swift is awesome and remembers which tableview your coming from.

# day 11 (wednesday)
Improved the player ratings, to make it more realistic. Also found some flaws in the API's, like a player who went to college Germany (there isn't any), so hardcoded it to be "Didn't attend college". Made a searchbar for the player tableview. Did go well, but had an error with the team tableview, will continue on it after the hackathon

# day 12 (thursday)
Hackathon

# day 14 (friday)
Today I made a delay between getting from the simulatorVC to the simulatorResultVC. First it was very simple and easy just to simulate a game between two teams. So I made a alert that takes 2 seconds that shows something like "crunching numbers" and after that performs the segue to the next vc. First the simulate button performed the show segue but now the simulate button will be an action that calls the function alert and then the alert will call perform the segue from vc to vc. I finished the searchbar for the teams today, turned out I made a typo. Also made a searchbar for the roster tableview, exactly the same as the player searchbar. A couple of days ago the player searchbar only searched the lastnames of players, which in my mind is inconvenient if you only know the player by first name, so now the searchbar searches for both the first- and last name. Unfortunately I couldn't figure out how to search for both at the same time (now if you look for lebron james for example you get no result because you look for the whole name), but in my mind that is not necessary because if you already know his first- or last name it is not needed to search for the whole name. Also I made a loading label in de modesVC so the user knows what is going on (a description of it).

# day 15 (monday)
Was sick

# day 16 (tuesday)
Today I made some inprovements in the player detail VC, normally for most foreign players their birthplace was shown in the college label. I hardcoded it to be "Didn't go to college". Made an app icon today. Linked my app to firebase and implemented a login and register page were users can login and signup with their email and password. I wanted to add a username to it (which I will leave in there for any future work) and the plan was to show that username in the modesVC with "Welcome (Username)!". Also when the searchbar was activated and you scrolled down in either of the three tableviewcontrollers and clicked on a cell and returned you would end up all the way back up in the tablview. By adding a cancel button this problem is fixed. A user can press the cancel button and the searchbar is deactivated.

# day 17 (wednesday)


