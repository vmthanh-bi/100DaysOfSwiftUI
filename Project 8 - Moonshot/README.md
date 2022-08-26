# Project 08 - Moonshot

This project is an app that lets users learn about the missions and astronauts that formed NASA’s Apollo space program.

Day 39: https://www.hackingwithswift.com/100/swiftui/39

## Topics

- Working with Nested Structs
- Generics
- Geometry Reader
- ScrollView
- Navigation
- layoutPriority
- Codable hierarchy
- Generics

## Day 1

- Resizing images to fit the screen with GeometryReader
- How scroll view works with Scrolling Data
- Pushing new views onto the stack through Navigation Link
- Working with hierarchical Codable data

## Day 2

- Loading a specific kind of Codable data 
- Using Generics to load any kind of Codable data
- Creating the MissionView Layout

## Day 3

- Showing mission details in a ScrollView and displaying the badge using GeometryReader
- Merging data using `(where:)`
- Fixing problems using `PlainButtonStyle()` and `layoutPriority()`

## Day 4

### Challenges

>1. Add the launch date to MissionView, below the mission badge.

Added Text to the VStack and called the variable .formattedLaunchDate

>2. Modify AstronautView to show all the missions this astronaut flew on.

Used the complete Missions array to make a for loop in order to check if the current astronaut appears in any. If so, we add that mission to screen. In the ForEach loop of Missions, I created a view for each mission that displays its name and image.

>3. Make a bar button in ContentView that toggles between showing launch dates and showing crew names.

Added a button in the navigation a 2 @State variables, one toogles a bool and the other changes the button name. Get the Full name of the crewMember with a new func, and with the toogle we can set an IF that shows or hide the launch date, and make the names appear or disappear. I created a new function to return the full name of a crew member and used the toggle to make an IF statement that alternates between showing or hiding the names or dates.
