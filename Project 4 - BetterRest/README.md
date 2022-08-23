# Project 04 - BetterRest

  Adding some more SwiftUI skills using machine learning.
  
  Day 26: https://www.hackingwithswift.com/100/swiftui/26

## Topics

- DatePickers, DateComponents and DateFormatters
- Steppers
- Navigation Bar items
- Creating Machine Learning Models using CreateML
- Integrating MLModel with SwiftUI using CoreML 

## Day 1

- Introduction and Project Setup
- Steppers
- DatePickers
- DateComponent and DateFormatters
- Create a ML Model using CreateML app

## Day 2

- Creating the User Interface with Stepper and DatePicker
- Integrating model the ML Model with SwiftUI for model prediction
- Cleaning up the user interface

## Day 3

### Challenges

>1. Replace each VStack in our form with a Section, where the text view is the title of the section. Do you prefer this layout or the VStack layout? It’s your app – you choose!

Added section while keeping the VStack to create the view without the line of the form.

>2. Replace the “Number of cups” stepper with a Picker showing the same range of values.

Replaced the stepper with a picker, with a small modification to the IF statement.

>3. Change the user interface so that it always shows their recommended bedtime using a nice and large font. You should be able to remove the “Calculate” button entirely.

Removed the calculate button, and modified the calculatedBedTime function to return a STRING. The new function will now use it in a Text component to show the result on the screen.
