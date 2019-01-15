# day 0
I started working on the app at the end of the holiday. Made some screens, and experimenten with ways to implement user login-in/register. I will continue doing that later. Today I made sure that 2 of the 4 API's I'm going to use are in my app. I decided to load and proces all the data in de modesVC and not in the views that it is actually used. The player stats view will have the player ratings. Those ratings are needed for the team rating in the team view, and those team ratings are needed in the simulator view. So by making sure all the ratings are already made by the data that is loaded, all the views that come after simply just have to show them, since the views that show the player and team ratings are not connected to each other and the modesVC "connects" them.


# day 1
I started working on the 2 API's I already loaded. First the team API, I build a loop that if the team in the API is an NBA Franchise, append it to the list of NBA teams I made. For the players I made 2 lists to append to. One for the players itself and one for the playerID's. Those ID's are in the playerstats url itself, thus needing it to load that API. 

I made a for loop in the playerstats API to load all playerID url's. Making a list for playerStats, while loading the API it appends to that list each time it loops through the playerID list.


# dat 2
Today I prepared the Player API and the Team API, to show them in a table view. This is not something special. I made a prepare through the tab bar controller, to the right navigation controller. Tada, all the NBA players and NBA teams were shown in two seperate table views, but most of the teams and players were shown double... I found out I loaded the players/teams from the NBA season, NBA Summer Leage and the NBA Africa game. I simply just had to load the NBA Season (standard) from those API's and the problem was fixed.

For the NBA teams I made a view controller after the table view that shows the team details of the clicked NBA team. 


# day 3
Today I started working on the schedule API. I struggled all day to load it, because the API had some stupid variable names such as 'is' or 'as' and I couldn't figure out how get around this. After a day struggling I did something smart, I looked up if the information of those variables where needed for my app. The answer was no... thus solving the problem.


# day 4
I wanted to show that my NBA Playerstats API is loading, since the app crashes if the user clicks on buttons while the API is still being loaded. It takes about 15 seconds for all the API's located in the modesVC to be loaded. 

Another thing I wanted to do today is a completion to make sure the playerstats API is loaded after the player API is loaded. Before this I used a sleep of about 3 seconds. Inorder to fix this I made a completion to fix this. After this I wanted to show the API's were still loading. For this I used a activity indicator and while it shows, disables all user interactions. I decided to start this while the player API starts loading. Not before the team API since it is so small and loads very quick, it doesn't need to be put infront. I put the end of the activity indicator inside my playerstats API, but that didn't work since it is a for-loop, so after one playerstats was loaded it would end. For this is made a completion handler inside the previous mentioned completion handler. So as soon as the playerstats is loaded completely it would end the activity indicator and thus enables the user to interact again. To know when the playerstats API is fully loaded I made an if statement that if the current number of loops is equal to the idList (- 1), the playerstats loading is complete. 

After this I took a quick look at the simulator. I made a picker with two variables to choose (two NBA teams) and the selected teams are prepared to show on the next view (that will show the simulated score eventually).

# day 5
Found some code on the internet that shows you the current date aswell as the date of yesterday and tomorrow. I can use this with my schedule API to determine which games have passed (and give score points to users) and to determine which game is today, so users can choose the team to win.

I made a completion for the teams aswell (so a completion in a completion in a completion) so that the teams will be loaded with their teamID, then the players are loaded with their teamID so I can create the roster for all NBA teams, and then the stats are loaded with the playerID's retrieved from the player API.

Loading the leaderboard API takes a few seconds, so just to be save I made the same completion with interactions disables as with the other 3 API's

Hardcoded my simulator today. Added the score simulator. Implemented a randomizer for the home team score and away team score. The randomizer's minimum is the lowest rating of overall, defensive or offensive and the same counts for the randomizer's upperbound. For the home team there is a (4 in 5)^2 change to have an advantage over the away team, but there is a (1 in 5)^2 change that the away team blows the home team out, or the home team simply sucks.

# day 6

