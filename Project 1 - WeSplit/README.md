# Project 01 - WeSplit

  This project is a check-sharing app that calculates how to split a check based on the number of people and how much tip you want to leave. 
  Day 16: https://www.hackingwithswift.com/100/swiftui/16

## Topics

- Forms
- @State
- Two Way Binding
- Textfields
- Sections
- Pickers and Segmented Control
- Navigation View

## Day 1

- Introduction and setting up the project in Xcode
- Understanding the basic structure of a SwiftUI app
- Creating a form
- Adding a Navigation Bar
- Modifying program state
- Binding state to user interface controls
- Creating views in loops

## Day 2

- Reading text from the user with Textfield
- Creating pickers in form
- Adding segmented controls
- Calculating total using Computed Properties

## Day 3

### Challenges

> 1.Add a header to the third section, saying “Amount per person”

Added a new Section with the Header Text and showing the amount per person.

> 2.Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.

Added a new Section with the header text, and displayed the total amount. The amount was by the commuted property totalWithTip. Doing a classic mathematic Rule of Three to get the amount of the tip later adding it to the total amount to get the result.

> 3.Change the “Number of people” picker to be a text field, making sure to use the correct keyboard type.

Changed the picker to text field, and adding the property .keyboardType(.decimalPad) to only let the user type numbers.
