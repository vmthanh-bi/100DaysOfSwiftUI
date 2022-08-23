# Project 02 - GuessTheFlag

  Day 20 of "100 days of SwiftUI".
  https://www.hackingwithswift.com/100/swiftui/20

## Topics

- Buttons
- Gradients
- Colors
- HStack, VStack and ZStack
- Images
- Alerts
- Clipshapes

## Day 1

- Introduction and Project Setup
- Arranging views with stacks : VStack, HStack and ZStack
- Colors and frames
- Gradients: Linear, Angular and Radial
- Buttons and Images
- Showing alert messages

## Day 2

- Stacking up the buttons 
- Using alert to showing player's score 
- Styling flags

## Day 3

### Challenges

>1. Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert.

Added the new @State variable, and modified it in the flagTapped function. If the user is correct we add 1 point to score, and if the user is wrong we reduce 1 from the score, as long as the score is not 0.

>2. Show the player’s current score in a label directly below the flags.

Added the last VStack to make 2 Texts - one for placing “Score” and one to display the score of the user.

>3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.

Changed the message when the user chooses a wrong answer so the alert to the name of the wrong flag.
