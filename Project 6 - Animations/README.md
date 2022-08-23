# Project 06 - Animations

Experimenting and implementing the range of tools for animations.
Day 32: https://www.hackingwithswift.com/100/swiftui/32

## Topics

- Animations
- Transitions

## Day 1

- Creating implicit animations
- Customising implicit animations
- Animations bindings
- Creating explicit Animations

## Day 2

- Managing animation stack
- Animation Gestures
- Showing and hiding views using transitions
- Building custom animation modifiers

## Day 3

### Challenges

>1. When you tap the correct flag, make it spin around 360 degrees on the Y axis.

Added a 3DRotation effect to the buttons, using a array of "Floats spinYAnimationAmounts" to interact with the button. When the user taps the correct flag, the animation is activated.

>2. Make the other two buttons fade out to 25% opacity.

Created a bool variable for knowing when to show the opacity, and added the opacity modifier to the buttons so the view fades out buttons that are not the correct answer.
