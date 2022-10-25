# Milestone: Projects 16-18 - Dice Roller

This is my final challenge in these 100 days.

This project is an app that helps users roll dice then store the results they had. At the very least it should let users roll dice, and see results from previous rolls. 

Day 95: https://www.hackingwithswift.com/100/swiftui/95

## Challenge

Breaking it down, you should:

- Wrap PHPickerViewController so it can be used to select photos.

- Detect when a new photo is imported, and immediately ask the user to name the photo.

- Save that name and photo somewhere safe.

- Show all names and photos in a list, sorted by name.

- Create a detail screen that shows a picture full size.

- Decide on a way to save all this data.

You can use Core Data for this project if you want to, but it isn’t required – a simple JSON file written out to the documents directory
is fine, although you will need to add a custom conformance to Comparable to get array sorting to work.

If you do choose to use Core Data, make sure you don’t save the actual image into the database because that’s not efficient. Core Data or 
not, the optimal thing to do is generate a new UUID for the image filename then write it to the documents directory, and store that UUID in
your data model.

## Topics covered in the last three projects:

- Reading environment values using `@EnvironmentObject`.
- Creating tabs with `TabView`.
- Using Swift’s `Result` type to send back success or failure.
- Manually publishing `ObservableObject` changes using oobjectWillChange.send()`.
- Controlling image interpolation.
- Adding swipe actions to list rows.
- Placing buttons in a `ContextMenu`.
- Creating local notifications with the `UserNotifications`` framework.
- Using third-party code with Swift package dependencies.
- Using `map()` and `filter()` to create new arrays based on an existing one.
- How to create dynamic QR codes.
- Attaching custom gestures to a SwiftUI view.
- Using `UINotificationFeedbackGenerator` to make iPhones vibrate.
- Disabling user interactivity using `allowsHitTesting()`.
- Triggering events repeatedly using `Timer`.
- Tracking scene state changes as our app moves between the background and foreground.
- Supporting color blindness, reduced motion, and more.
- SwiftUI’s three step layout system.
- Alignment, alignment guides, and custom alignment guides.
- Absolutely positioning views using the `position()` modifier.
- Using `GeometryReader` and `GeometryProxy` to make special effects.


## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
<img src="Screenshots/Screenshot 5.png" width="300"/> <img src="Screenshots/Screenshot 6.png" width="300"/>
