# Project 13 - Instafilter

This project is an app that lets the user import photos from their library, then modify them using various image effects.

Day 62: https://www.hackingwithswift.com/100/swiftui/62

## Topics

- Integrating with `UIKit`
- Coordinators in SwiftUI
- Core Image Framework
  - `CoreImage`
  - `CIFilter`
  - `CIImage`
  - `CGImage`
  - `UIImage`

## Day 1

- How property wrappers become structs
- Custom bindings
- Showing multiple options with ActionSheet

## Day 2

- Integrating `CoreImage` with `SwiftUI`
- Wrapping a `UIViewController` (UIImagePickerController) in a SwiftUI View

## Day 3

- Using coordinators to manage SwiftUI View Controllers to intergrate `UIKit` with SwiftUI
- Saving images in user's Photo Library

## Day 4

- Building a basic UI
- Importing an image into SwiftUI using `UIImagePickerController`
- Basic image filtering using `CoreImage`

## Day 5

- Adding different Core Image filters through inputKeys and `ActionSheet`
- Saving the filtered image and handling error and image saving with handlers

## Day 6
### Challenges

>1. Try making the Save button show an error if there was no image in the image view.

Added an `Alert` when user taps save but has not selected an image.


>2. Make the Change Filter button change its title to show the name of the currently selected filter.

Added an `@State` variable to get the current filter name to change when the user selects a new filter.

>3. Experiment with having more than one slider, to control each of the input keys you care about. For example, you might have one for radius and one for intensity.

- Added 2 new properties: `filterRadius` and `filterScale`
- Added new sliders and updated the view to only show the sliders if the current filter accepts that modifier
- Set variables for radius, scale and intensity in the processing of the image
