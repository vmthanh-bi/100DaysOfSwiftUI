# Project 18 - Layout and Geometry

This project's objective is to learn more about SwiftUI’s three step layout system.

Day 62: https://www.hackingwithswift.com/100/swiftui/62

## Topics

- `GeometryReader`
  - Frames and Coordinates
  - Global, Custom and Local Center
- Alignment and AlignmentGuides

## Day 1

- How SwiftUI layout system works
- Alignment and alignment guides
- Creating a custom alignment guide

## Day 2

- Absolute Positioning in SwiftUI using `position()` and `offset()`
- Understanding frames and coordinates in `GeometryReader`
  - Global
  - Custom
  - Local Center
- ScrollView effects using `GeometryReader`

## Day 3
### Challenges

>1. Change project 8 (Moonshot) so that when you scroll down in MissionView the mission badge image gets smaller. It doesn’t need to shrink away to nothing – going down to maybe 80% is fine.

In Project 8 - MissionView, used `GeometryReader` to add a Scaling Effect on the image so that it shrinks as wanted when scrolling

>2. Change project 5 (Word Scramble) so that words towards the bottom of the list slide in from the right as you scroll. Ideally at least the top 8-10 words should all be positioned normally, but after that they should be offset increasingly to the right.

In Project 5 - WordScramble, added Offset Positioning

>3. For a real challenge make the letter count images in project 5 change color as you scroll. For the best effect, you should create colors using the Color(red:green:blue:) initializer, feeding in values for whichever of red, green, and blue you want to modify. The values to input can be figured out using the row’s current position divided by maximum position, which should give you values in the range 0 to 1.

In Project 5 - WordScramble, used `GeomateryReader` to add ScrollView Effect and a modifier that changes the color of the text
