# Project 07 - iExpense

Learning how to show another screen, how to share data across screens, how to load and save user data, and more!

Day 36: https://www.hackingwithswift.com/100/swiftui/36

## Topics

- UserDefaults
- sheet()
- onDelete()
- Codable and Identifiable Protocols
- @Published and @ObservedObject Protocol
- Modal Sheet View
- @State working only with Structs

## Day 1

- Why @State only works with Structs
- Sharing SwiftUI state with @ObservedObject
- Showing and hiding views using Sheet
- Deleting items in a list using onDelete()
- Storing user settings with UserDefaults
- Archiving Swift objects with Codable

## Day 2

- Building a list for showing the expenses which is also deletable
- Using UUID to work with Identifiable Protocol 
- Sharing an ObservedObject with a new view
- Making changes permanent with UserDefaults
- Final polish of the user interface

## Day 3

### Challenges

>1. Add an Edit/Done button to ContentView so users can delete rows more easily.

Added the leading EditButton() to the navigation bar items.

>2. Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.

Created a function for the view to set the foreground color of the amount, returning green, orange or red according to the range of the value.

>3. Add some validation to the Save button in AddView. If you enter “fish” or another thing that can’t be converted to an integer, show an alert telling users what the problem is.

Added an alert to the Sheet so that, when input can’t be converted to an integer, the code triggers the amountError into true and triggers the Alert.
