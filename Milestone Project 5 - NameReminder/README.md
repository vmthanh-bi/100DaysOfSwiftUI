# Milestone: Projects 13-15 - Name Reminder

This project is  an app that asks users to import a picture from their photo library, then attach a name to whatever they imported. 
The full collection of pictures they name should be shown in a List, and tapping an item in the list should show a detail screen with 
a larger version of the picture.

Day 77: https://www.hackingwithswift.com/100/swiftui/77

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

- How property wrappers become structs
- Presenting confirmation dialogs with lots of buttons
- Using Core Image to manipulate images
- Integrating `PHPickerViewController` into SwiftUI
- Writing coordinator classes that can act as delegates for image pickers
- Integrating maps into SwiftUI
- Dropping pins on maps
- Saving images to the user’s photo library
- Adding `Comparable` conformance to custom types
- Finding and writing to the user’s documents directory
- Enabling file encryption when writing
- Authenticating users with Touch ID and Face ID

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
