# Project 11 - Bookworm

This project is an app to track which books you’ve read and what you thought of them using Core Data and custom user interface components.

Day 53: https://www.hackingwithswift.com/100/swiftui/53

## Topics

- CoreData 
  - `FetchRequests`
  - `NSSortDescriptor`
  - `FetchedResults`
  - Entities
  - Attributes
-  Creating custom UI Component with Binding Property Wrapper
- Custom Alert

## Day 1

- `@Binding` property wrapper
- AnySize View 
- Combining `CoreData` with SwiftUI

## Day 2

- Creating objects using `CoreData`
- Creating custom UI Component using `Binding`
- Building a list using `@FetchRequest`

## Day 3

- Showing Book Details in another View
- Sorting fetch requests using `NSSortDescriptor`
- Deleting a book from a `CoreData` fetch request
- Using a custom alert to pop a `NavigationLink` programmatically

## Day 4
### Challenges

>1. Right now it’s possible to select no genre for books, which causes a problem for the detail view. Please fix this, either by forcing a default, validating the form, or showing a default picture for unknown genres – you can choose.

Created an `Alert` in the DetailView, and a function to see if the genre string is empty or not. If empty, show an alert.

>2. Modify ContentView so that books rated as 1 star have their name shown in red.

Added a `foregroundColor` modifier to set the text color as red when the book rating is 1.

>3. Add a new “date” attribute to the Book entity, assigning Date() to it so it gets the current date and time, then format that nicely somewhere in DetailView.

Added `Date` attribute to the Book entity, so when a new book is created we set the date value to `Date()` to get the time and hour of creation. I also added to the detail view the formatted creation date.
