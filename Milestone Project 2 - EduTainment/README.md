# Milestone: Projects 4-6 - EduTainment

This project is an “edutainment” app for kids to help them practice multiplication tables – “what is 7 x 8?” and so on. 
Edutainment apps are educational at their code, but ideally have enough playfulness about them to make kids want to play.

Day 35: https://www.hackingwithswift.com/100/swiftui/35

## Challenge

Breaking it down:

- The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.

- The player should be able to select how many questions they want to be asked: 5, 10, or 20.

- You should randomly generate as many questions as they asked for, within the difficulty range they asked for.

- If you want to go fully down the “education” route then this is going to be some steppers, a text field and a couple of buttons. I would suggest that’s a good place to start, just to make sure you have the basics covered.

Once you have that, it’s down to you how far you want to take the app down the “entertainment” route – you could throw away fixed controls like Stepper entirely if you wanted, and instead rely on colorful buttons to get the same result.

This is one of those challenges that is best approached step by step: get something working first, then improve it as far as you want. Maybe you’re happy with a simple app, or maybe you really want to spend some time crafting a fun design. It’s down to you!

To solve this challenge you’ll need to draw on skills you learned in all the projects so far, but if you start small and work your way forward you stand the best chance of success. At its core this isn’t a complicated app, so get the basics right and expand only if you have the time.

At the very least, you should:

1. Start with an App template, then add some state to determine whether the game is active or whether you’re asking for settings.

2. Generate a range of questions based on the user’s settings.

3. Show the player how many questions they got correct at the end of the game, then offer to let them play again.

## Topics covered in the last 3 projects

- How to read numbers from users with `Stepper`, including using its shorter form when your label is a simple text view.
- Letting the user enter dates using `DatePicker`, including using the `displayedComponents` parameter to control dates or times.
- Working with dates in Swift, using `Date`, `DateComponents`, and `DateFormatter`
- How to bring in machine learning to leverage the full power of modern iOS devices.
- Building scrolling tables of data using `List`, in particular how it can create rows directly from arrays of data.
- Running code when a view is shown, using `onAppear()`.
- Reading files from our app bundle by looking up their path using the `Bundle` class, including loading strings from there.
- Crashing your code with `fatalError()`, and why that might actually be a good thing.
- How to check whether a string is spelled correctly, using `UITextChecker`.
- Creating animations implicitly using the `animation()` modifier.
- Customizing animations with delays and repeats, and choosing between ease-in-ease-out vs spring animations.
- Attaching the `animation()` modifier to bindings, so we can animate changes directly from UI controls.
- Using `withAnimation()` to create explicit animations.
- Attaching multiple `animation()` modifiers to a single view so that we can control the animation stack.
- Using `DragGesture()` to let the user move views around, then snapping them back to their original location.
- Using SwiftUI’s built-in transitions, and creating your own.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
<img src="Screenshots/Screenshot 7.png" width="300"/> <img src="Screenshots/Screenshot 8.png" width="300"/>
