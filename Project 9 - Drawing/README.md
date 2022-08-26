# Project 09 - Drawing

This project will take a closer look at drawing in SwiftUI, including creating custom paths and shapes, animating your changes, solving performance problems, and more.

Day 43: https://www.hackingwithswift.com/100/swiftui/43

## Topics

- Paths
- Shapes
- Strokes
- CGAffineTransforms
- Drawing groups
- SwiftUI Image Effects
- Animating values with AnimatablePair and AnimatableData
- Creating Complex Shape Structs
- InSettable Shape Protocol
- Core Animation
- Metal

## Day 1

- Creating custom path to create shapes like Triangle
- Finding the difference between Paths and Shapes in SwiftUI
- Adding strokeBorder support to custom shapes using the InsettableShape

## Day 2

- Transforming shapes using `CGAffineTransform` and even-odd fills
- Making creative border fills using ImagePaint
- Enabling high-performance Metal rendering using `drawingGroup()`

## Day 3

- Working on special effects in SwiftUI: blurs, hue, saturation and blending modes, .multiply and .screen
- Animating shapes using animatableData
- Animating complex shapes using AnimatablePair
- Creating a spirograph 

## Day 4

### Challenges

>1. Create an Arrow shape made from a rectangle and a triangle – having it point straight up is fine.

Created paths combined with rectangles and triangle make an arrow.

>2. Make the line thickness of your Arrow shape animatable.

Added a tap gesture to the arrow and assigned to is a function that changes the lineWidth to a random float from 1 to 15.

>3. Create a ColorCyclingRectangle shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using a property.

Used Paul Hudson's ColorCyclingCircle but changed it accordingly to the shape of a rectangle.
