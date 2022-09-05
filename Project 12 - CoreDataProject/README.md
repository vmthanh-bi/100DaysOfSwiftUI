# Project 12 - CoreDataProject

This project explores Core Data in more detail with custom managed object subclasses, ensuring uniqueness, and more.

Day 57: https://www.hackingwithswift.com/100/swiftui/57

## Topics

- Core Data 
  - `NSPredicate`
  - `NSSortDescriptors`
  - Dynamic Filtering
  - `NSManagedObjectSubclasses`

## Day 1

- How `\.self` works for ForEach?
- Creating `NSManagedObject` subclasses for Entity and Attributes
- Conditional saving of `NSManagedObjectContext`
- Unique `CoreData` objects using constraints

## Day 2

- Filtering `FetchRequests` using `NSPredicate`
- Dynamic filtering with any `CoreData` Entity Type
- Cardinality in Core Data using `SwiftUI` and `FetchRequest`

## Day 3

- Showing Book Details in another View
- Sorting fetch requests using `NSSortDescriptor`
- Deleting a book from a `CoreData` fetch request
- Using a custom alert to pop a `NavigationLink` programmatically

## Day 4
### Challenges

>1. Make it accept an array of NSSortDescriptor objects to get used in its fetch request.

Added an array of `NSSortDescriptor` to the FilteredList initializer, and replaced [ ] from `FetchRequest` with the array from init.

>2. Make it accept a string parameter that controls which predicate is applied. You can use Swift’s string interpolation to place this in the predicate.

Added a predicate `String` to the initializer, to allow the user specify which predicate they want to use, then changed the static value of the predicate in `FetchRequest` to a `String` interpolated variable.

>3. Modify the predicate string parameter to be an enum such as .beginsWith, then make that enum get resolved to a string inside the initializer.

Added a enum of strings of each case in the `filteredList` view that can be used as a predicate, then changed the initializer from predicate `String` to the `Predicates` enum.
