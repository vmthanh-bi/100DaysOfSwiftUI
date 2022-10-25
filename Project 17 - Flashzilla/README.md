# Project 17 - Flashzilla

This project is an app that helps users learn things using flashcards – cards that have one thing written, and have another thing written 
on the other side by making the detail for the flash card appear when it’s tapped.

Day 86: https://www.hackingwithswift.com/100/swiftui/86

## Topics

- Gestures
  - Drag
  - Magnification
  - Rotation
- `UINotificationFeedbackGenerator`
- `allowsHitTesting()`
- `contentShape()`
- Haptics with `CoreHaptics`
- Timers

## Day 1

- Using various gestures in SwiftUI
  - `TapGesture`
  - `LongPressGesture`
  - `MagnificationGesture`
  - `RotationGesture`
  - `DragGesture`
- Working `UINotificationFeedbackGenerator` and `CoreHaptics`
- Disabling user interactivity using `allowsHitTesting()` and `contentShape()`

## Day 2

- Triggering events repeatedly with a Timer publisher
- Notifying with the help of Notification Center when app moves to foreground and background or is in any other state
- Adding support for specific accessbility needs
  - Reduce Motion
  - Reduce Transparency
  - Differentiate with Color

## Day 3

- Creating `CardView`
- Creating a `CardView` stack
- Creating a `DragGesture` for the `CardView` and moving it with `offset()`

## Day 4

- Coloring `CardView` when swiping left and right with Accessbility
- Counting down with Timer and pausing it when the app is in background
- Disabling Card Interactivity using `allowsHitTesting()` once the timer runs out and reset the stack again

## Day 5

- Creating haptic feedback when swiping right or wrong card with `UINotificationFeedbackGenerator()`
- Fixing bugs and enhancing VoiceOver support
- Adding and deleting cards with `StackNavigationViewStyle()`

## Day 6
### Challenges

>1. Make something interesting for when the timer runs out. At the very least make some text appear, but you should also try designing a custom haptic using Core Haptics.
 
Added alert and haptics when the timer reaches 0, and modified the code accordingly.

>2. Add a settings screen that has a single option: when you get an answer one wrong that card goes back into the array so the user can try it again.

Added function in both CardView and MainView to know when the card is incorrect and stacks it back into the array.

>3. If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: use a custom modifier for this to avoid cluttering your body property.)

The offset was originally made to detect the cards going left or right. When the card is pulled in a certain direction and isn't removed, it will bounce back
in the opposite direction to the center, hence coloring the card in the opposite color from the original. To fix this, I modified the if statement
so that the offset changes the color of the cards relative to the center rather than direction in which the card is pulled.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="500"/> <img src="Screenshots/Screenshot 2.png" width="500"/> 
<img src="Screenshots/Screenshot 3.png" width="500"/> <img src="Screenshots/Screenshot 4.png" width="500"/>
<img src="Screenshots/Screenshot 5.png" width="500"/> <img src="Screenshots/Screenshot 6.png" width="500"/> 
<img src="Screenshots/Screenshot 7.png" width="500"/> <img src="Screenshots/Screenshot 8.png" width="500"/>
<img src="Screenshots/Screenshot 9.png" width="500"/>
