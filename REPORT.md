# NBA Simulator
![](docs/Appflow.png)
## Short description
You're an NBA fan and like to watch some games once in a while. But you have no clue which team is going to win each night and which player is on which team. A user can look up all players, teams, and their rosters. To see which team is more likely to win there is a simulator where the user can select to teams to play eachother

## Clearly describe the technical design: how is the functionality implemented in your code? This should be like your DESIGN.md but updated to reflect the final application. First, give a high level overview, which helps us navigate and understand the total of your code (which components are there?). Second, go into detail, and describe the modules/classes (apps) files/functions (data) and how they relate.

## Technical design
All the way up in the report there is the app flow visualized.

Structure of the app
- The initial view controller is [loginVC](https://github.com/snellebribo98/NBA-Simulator/blob/master/NBA_Score/Login%20%26%20Register/LoginVC.swift) where the user can login or click to register. If the user clicks on the register button it will be directe to [NexRegisterVC](https://github.com/snellebribo98/NBA-Simulator/blob/master/NBA_Score/Login%20%26%20Register/NexRegisterVC.swift) where the user will sign-up. If the user was already logged in, logged in when the app started, or signed up it will be directed to [modesVC](https://github.com/snellebribo98/NBA-Simulator/blob/master/NBA_Score/modesVC.swift)

## Clearly describe challenges that your have met during development. Document all important changes that your have made with regard to your design document (from the PROCESS.md). Here, we can see how much you have learned in the past month. Defend your decisions by writing an argument of a most a single paragraph. Why was it good to do it different than you thought before? Are there trade-offs for your current solution? In an ideal world, given much more time, would you choose another solution?


## Make sure the document is complete and reflects the final state of the application. The document will be an important part of your grade.


