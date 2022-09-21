# Milestone: Projects 7-9 - Habits

This project is a habit-tracking app, for folks who want to keep track of how much they do certain things. 
That might be learning a language, practicing an instrument, exercising, or whatever – they get to decide which activities they add, 
and track it however they want.

Day 47: https://www.hackingwithswift.com/100/swiftui/47

## Topics covered in the last three projects:

- Why `@State` only works with structs.
- How to use `@ObservedObject` to work with classes.
- How `@Published` lets us announce property changes to any SwiftUI views that are watching.
- Presenting and dismissing views using the `sheet()` modifier and `presentationMode`.
- Using `onDelete(perform:)` to enable swipe to delete.
- Adding `EditButton` to navigation bar items, to let users edit list data more easily.
- Reading and writing data with `UserDefaults`.
- Archiving and unarchiving data with `Codable`, including working with data stored in a hierarchy.
- Using the `Identifiable `protocol to make sure all items can be identified uniquely in our user interface.
- How to use `GeometryReader` to make content fit the screen.
- Using `ScrollView` to lay out custom views in a scrollable area.
- Pushing new views onto the navigation stack using `NavigationLink`.
- Using Swift’s generics system to write methods that work with different kinds of data.
- How to use Swift’s `first(where:)` method to find the first element in an array that matches a predicate.
- Using `layoutPriority()` to adjust how much space is allocated to a view.
- Creating custom paths and shapes.
- Creating shapes that can be inset and have their border stroked, using `InsettableShape`.
- Using `CGAffineTransform` to create rotations and translations.
- Making creative borders and fills using `ImagePaint`.
- Enabling Metal for drawing complex views using `drawingGroup()`.
- Modifying blend modes and saturation.
- Animating shapes with `animatableData` and `AnimatablePair`.

## Challenge

At the very least, there should be a list of all activities they want to track, plus a form to add new activities – a title and description should be enough.

For a bigger challenge, tapping one of the activities should show a detail screen with the description. For a tough challenge, make that detail screen contain how many times they have completed it, plus a button incrementing their completion count.

And if you want to make the app really useful, use Codable and UserDefaults to load and save all your data.

So, there are three levels to this app, and you can choose how far you want to go depending on how much time you have and how far you want to push yourself.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> <img src="Screenshots/Screenshot 3.png" width="300"/>
