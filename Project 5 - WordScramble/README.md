# Project 05 - WordScramble

Working with two of the real fundamentals of app development: List for working with tables of data, and strings, for handling text. 

Day 29: https://www.hackingwithswift.com/100/swiftui/29

## Topics

- Lists
- UITextChecker
- Bundle
- onAppear
- fatalError()

## Day 1

- Introduction and Project Setup
- Lists
- Loading files from app bundle
- Working with Strings and UITextChecker

## Day 2

- Adding words to the List
- Running code and loading the file when the app launches
- Verifying for valid words using the UITextChecker

## Day 3

### Challenges

>1. Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest thing to do is put a check into isReal() that returns false if the word length is under three letters. For the second part, just compare the start word against their input word and return false if they are the same.

Added a guard in the isReal function that checks if the word has more than two letters. For the second part, I added another guard in the new word function that checks if the word was the same as rootWord. 

>2. Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.

Added a left bar button to change to a new word.

>3. Put a text view below the List so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.

Added a VStack containing two Texts, one for the title and one for the score. The score value is changed every time user adds a new word to calculate the new score.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
