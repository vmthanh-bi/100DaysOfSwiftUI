# Milestone: Projects 1-3 - VolumeConverter

This project is a brain training game that challenges players to win or lose at rock, paper, scissors.

Day 25: https://www.hackingwithswift.com/100/swiftui/25

## Challenge

So, very roughly:

- Each turn of the game the app will randomly pick either rock, paper, or scissors.

- Each turn the app will alternate between prompting the player to win or lose.

- The player must then tap the correct move to win or lose the game.

- If they are correct they score a point; otherwise they lose a point.

- The game ends after 10 questions, at which point their score is shown.

So, if the app chose “Rock” and “Win” the player would need to choose “Paper”, but if the app chose “Rock” and “Lose” the player would need to choose “Scissors”.

## Topics covered in the last three projects

- Building scrolling forms that mix text with controls such as `Picker`, which SwiftUI turns into a beautiful table-based layout where new screens slide in with fresh choices.
- Creating a `NavigationView` and giving it a title. This not only allows us to push new views onto the screen, but also lets us set a title and avoid problems with content going under the clock.
- How to use `@State` to store changing data, and why it’s needed. Remember, all our SwiftUI views are structs, which means they can’t be changed without something like `@State`.
- Creating two-way bindings for user interface controls such as `TextField` and `Picker`, learning how using $variable lets us both read and write values.
- Using `ForEach` to create views in a loop, which allows us to make lots of views all at once.
- Building complex layouts using `VStack`, `HStack`, and `ZStack`, as well as combining them together to make grids.
- How to use colors and gradients as views, including how to give them specific frames so you can control their size.
- How to create buttons by providing some text or an image, along with a closure that should be executed when the button is tapped.
- Creating alerts by defining the conditions under which the alert should be shown, then toggling that state from elsewhere.
- How and why SwiftUI uses opaque result types (some View) so extensively, and why this is so closely linked to modifier order being important.
- How to use the ternary conditional operator to create conditional modifiers that apply different results depending on your program state.
- How to break up your code into small parts using view composition and custom view modifiers, which in turn allows us to build more complex programs without getting lost in code.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> <img src="Screenshots/Screenshot 3.png" width="300"/>
