# Project 19 - Snowseeker

This project an app to let users browse ski resorts around the world, to help them find one suitable for their next holiday.

Day 96: https://www.hackingwithswift.com/100/swiftui/96

## Topics

- Size Classes
- Split view layouts in iPad
- Binding an `alert` with optional values
- Flexible layouts with Group
- ListFormatter

## Day 1

- Discovering side by side split views in SwiftUI
- Using `alert()` and `sheet()` with optionals
- Using groups as transparent layout containers
- Making a SwiftUI view searchable

## Day 2

- Building a primary list of items
- Making `NavigationView` work in landscape
- Creating a secondary view for `NavigationView`
- Searching for data in a `List`


## Day 3

- Changing a view’s layout in response to size classes
- Binding an `alert` to an optional string
- Letting the user mark favorites

## Day 4

### Challenges

>1. Add a photo credit over the ResortView image. The data is already loaded from the JSON for this purpose, so you just need to make it look good in the UI.
Created a `Z-Stack` that stacks the image of the resort under a text of image credit.

>2. Fill in the loading and saving methods for Favorites.
Added the same file created from previous projects that saves data in the user documents, and modified Favorites to decode and encode data.

>3. For a real challenge, let the user sort and filter the resorts in ContentView. For sorting use default, alphabetical, and country.
Added a navigation bar button that calls an `actionSheet` allowing the user to choose to sort the list of resorts by country, size and price.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
<img src="Screenshots/Screenshot 5.png" width="300"/> <img src="Screenshots/Screenshot 6.png" width="300"/>
