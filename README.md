# Quiz Wiz

https://trello.com/b/6nrvfoDr/terminal

I started with the general idea of a trivia game to begin with, however it lacked a lot of direction.  There was a lot brainstormed features that could fit into a trivia app but my design lacked a theme.  I settled on the idea Quiz Wiz after starting to design a general trivia quiz that would have randomised questions drawing on general knowledge.  Quiz Wiz differes from this as it is targeted at a specific audience and uses the NESA NSW school syllabuses and Bloom's Taxonomy to draw inspiration for the conetent and design on the quiz.

## Sotware Development Plan

After finalising the theme of my quiz I thought that I would create a short quiz consisting of 6 rounds (one for each form of learning in Bloom's Taxonomy).  Each round was going to have 10 questions. The quiz was origonally going to have a VS mode that would pit 2 or more players against eachother in a similar fashion to a game show.  Each player would have to user a hotkey to activate their 'buzzer'.

### User Story (origonal)

- User begins game
- Title screen (options: singleplayer, VS mode, Highescores, Quit)
- User could set settings for the different gamemodes
- User start game
- Timer starts (based on settings)
- User presented with randomised question (new question posed after every answer, correct or not)
- Quiz ends when timer ends or all questions are answered
- A score screen is shown showing points earned for correct answers

### User Story (updated)

After starting to desgin a quiz in this fashion I switched over to the more education based quiz.  This resulted a lot of changes to the app (mostly removing a long list of planned and potential 'gimicky' features). Questions were no longer randomised as I found some of them too complex, although it may be possible with hashes and nests this was never completed.  VS mode was removed from the program and was never completed.  Rounds were added with scaling question difficulty, with fixed questions.

- User begins game
- Title screen (options: singleplayer, Highescores, Quit)
- User could set difficulty settings
- User start game
- Timer starts (based on settings)
- User presented with fixed questions (new question posed after every answer, correct or not)
- Each round of questions is separated by a prompt
- Quiz ends if User fails a round or passes all rounds (based on settings)
- A score screen is shown showing points earned for correct answers

This results in less replayability of the quiz. So I thought of adding a feature where users could add their own quizzes but this just reverts the app back to the general knowledge based quiz with low order thinking skills.  The inital rounds were reduced from 6 to 3 and the questions reduced from 10 to ~5 as it became quite hard to design questions that would both adhere to the syllabuses and Bloom's Taxonomy.

![Image](./docs/FlowChart.png)

### Statement of Purpose

Quiz Wiz is an educational trivia game designed to both help teach and reinforce information.  The questions are based around the NESA NSW syllabus for mostlt stage 3 (grades 5 and 6).  Some questions earlier on in the question could potentially draw on information learnt in stage 2 or stage 4 but should be too far away from grades 5 and 6.  Each round draws on at least 2 of the 6 types of learning outlined in Blooms Taxonomy, specifically to test every one.

### Functionality

Once the game has started Quiz Wiz the payer can set the timer for each question as well as a required mark to pass a round.  Each round will have a passing or failing point requirement determining if the player successfully continues to the next round.  Failing any round will result in an end game screen, the players score will still be presented even if they fail a round.  Successfully passing every round will result in a bonus for the players score.

#### Modify Quiz Settings

This is essentially the difficulty settings for the game, the user can set the pass/fail grade for each round whoch determines if they are able to continue with the round.  These settings are separated into the following difficulties: (pointless, easy, normal, hard, extreme).  These settings will change your results in the score screen as they will influence bonus points that are awarded throughout the quiz (bonus points are awarded for other achievements like score 100% in a round).

The timer setting is a little less complex with the following difficulties: (easy, normal, hard).  The timer is used to award bonus points at the end of the quiz, if the user beats it.

#### View and Save Highscores

Successfully completing the quiz allows the user to input thier name, saving their results in a text file.  This can be viewed inside the quiz app view the Title screen.  Your score breakdown is visible only when the quiz is completed.

#### Cheatsheet

Allows the user to open a text file to view all the answers to the quiz.  This is accessed via the the commandline and is not usually available via the app.

#### Future Feature Add Personalised Quizzes

Enable questions to and entire quizzes to be added into the app via text file.  Questions, answers, scoring and timers will all be set by the creator within the text file.  Text file creation needs to follow strict instructions to be readable by the app.

#### Target Audience

Quiz Wiz is intended for a younger audience that are in school (potentially teachers as well), with most questions being in relation to reinforce some of the learning outcomes of the NESA NSW syllabuses.

#### Instructions

the ruby gem colorize is required.

The program can be run with ruby App from the main folder in terminal

The Title screeen grants access to the inbuilt quiz as well as recorded highscores. From the quiz menu the user can either user the settings menu to change the Timer/Pass difficulty, begin the quiz or return to the title screen. The quiz menu also contains a breif introduction to he quiz.  Once the quiz begins the user will face each question one by one.  Upon completing a round a check will run to see if the user received a passing grade.  The quiz will not continue without a passing grade. When the quiz ends the players score will be shown and saved in a local file "Highscore" the difficulty setting will effect the final score.

Any input that is not recognised as an option in any of the menu screens will return an invalid input messge before resetting.

A cheatsheet can be accessed via the command line 'cheat' (ruby App cheat) which will show all the question in order with their respective answers.

## Testing

|              Feature             |                                                       Defined                                                      |                                                         Expected Outcome                                                         |                                                                                         Actual Outcome                                                                                        |                                                                          Is it a problem?                                                                         |
|:--------------------------------:|:------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|             **App Launch**           |                   A file outside the src directory that launches the game without a .rb extension                  |                                          The app launches and brings up the Title screen                                         |                                                                                           As expected                                                                                         |                                                                                 No                                                                                |
|            **Title Screen**          |                             The first menu of the app shows some options for the game.                             |                  Menu options should load (Quiz, Highscore, Quit) unless command line arguement 'cheat is used.                  |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|             **Cheatsheet**           |           A menu option that opens and reads a text file containing questions and answers from the quiz.           |                                    The text file is displayed and clears once enter is pressed                                   |                                                                                           As expected                                                                                         |                                       Would prefer to display one question at a time without displaying one line at a time.                                       |
|             **Highscore**            |                         A menu option that displays a text file with successful quiz scores                        |                                      Currently saved highscores are displayed one at a time.                                     |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|            **Quiz/Settings**         |                                                 A menu with in a menu                                              | Displays the start screen for the quiz and interacts correctly with the settings menu updating the timer and pass/fail visually. | No, after returning to the quiz menu from the score screen the timer show the time allocated to complete the entire quiz. When it should show the average that should be spent per question.  | Timer has been forced to reset to easy whenever a new quiz begins. Minor nuisance to the user if they want to repeatedly attempt the quiz on a higher difficulty. |
|            **Instructions**          |                       A brief overview of the quiz rules and how the user interacts with it.                       |                 Displays information in the quiz menu above  the options. Difficulty settings  are also displayed                |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|       **Questions and  Rounds**      |                                 Hard coded quiz with questions divided into rounds.                                |               Each question is printed one at a time. Rounds are separated by a prompt requiring enter to continue.              |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|  **Waiting for the timer to expire** | Timer - Records how long it takes the user to complete the quiz and matches it with how long they should've taken. |                 Makes a check at the end of round three failing the quiz and preventing a score from being saved.                |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|             **Pass/Fail**            |                      Uses a point system to determine if a round or quiz is considered passed                      |                      Pass - Allows user to progress to the next round. Fail - Sends user to the scorescreen.                     |                                                                                           As expected                                                                                         |                                                                                 No                                                                                |
|               **Saving**             |                             Accesses a text file to record information on quiz results.                            |                    Allows user to save score to a text file if all rounds are passed and the timer is beaten.                    |                                                                                           As expected                                                                                         |                                                                                  No                                                                               |
|           **Invalid Input**          |                                          Check for valid option selection                                          |                             Menus should return 'Invalid Input' if an unrecognised input is received.                            |                                                                                           As expected                                                                                         |                                                                                 No                                                                                |
|            **Scorescreen**           |                                                Displays quiz results                                               |       Prints a break down of points scored during the quiz and a point total. Returns the user to the quiz menu with enter.      |                                                                                          As expected                                                                                          |                                                                                 No                                                                                |