# Project 16 - Hot Prospects

This project is an an app to track who you meet at conferences. It will show a QR code that stores your attendee information, then others 
can scan that code to add you to their list of possible leads for later follow up.

Day 79: https://www.hackingwithswift.com/100/swiftui/79

## Topics

- Sharing custom data using `@EnvironmentObject`
- `UNUserNotifications`
- Encapsulation Principle
- Access control with `fileprivate` and `private`
- Tab bars and context menus
- `TabView`
- `Result`
- `objectWillChange`
- `filter()`
- `map()`
- QRCode generation with `CoreImage`
- Adding third party dependency using Swift Package Manager

## Day 1

- Reading custom values from the environment using `@EnvironmentObject`
- Creating tabs using `TabView` and `tabItems` for switching tabs


## Day 2

- Swift `Result` Type
- Publishing `@ObservableObject` changes
- Image interpolation

## Day 3

- Creating context menus
- Creating, requesting permssions and scheduling local notifications with `UNUserNotifications`
- Adding Swift package dependencies in Xcode

## Day 4

- Improving the tab bar with three different filters
- Sharing data across all tabs with `@EnvironmentObject`
- Dynamic filtering `List` in SwiftUI with `filter()`

## Day 5

- Generating a QRCode from a `String` using `CoreImage`
- Scanning a QRCode and inserting it to the list by adding a depedency through the Swift Package Manager
- Marking contacts as "Contacted" or "Uncontacted" using context menus

## Day 6

- Saving and loading data with `UserDefaults`
- Encapsulating objects and working with `AccessControl`
- Posting `UserNotifications`

## Day 7
### Challenges

>1. Add an icon to the “Everyone” screen showing whether a prospect was contacted or not.

Added variable `filterType` to the `ProspectView`, to know if the screen is "Everyone" and show whether the person was contacted or not.

>2. Use JSON and the documents directory for saving and loading our user data.

Used the usual `FileManager` class from previous projects and switched all the logic from `UserDefaults` to `FileManger`.

>3. Use an action sheet to customize the way users are sorted in each screen – by name or by most recent.

- Added button in navigation bar to deploy the action sheet
- Added comparable to prospect
- Added sorting options for the user to choose and sort the array accordingly
