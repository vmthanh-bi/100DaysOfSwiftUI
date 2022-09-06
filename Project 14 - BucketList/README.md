# Project 14 - Bucket List

This project is an app that lets the user build a private list of places on the map that they intend to visit one day, add a description for that place, 
look up interesting places that are nearby, and save it all to the iOS storage for later.

Day 68: https://www.hackingwithswift.com/100/swiftui/68

## Topics

- Integrating `MapKit`
- Embedding maps in SwiftUI
- Integrating Local Authentication
- Writing Usable Code
- Writing and Saving data in the Documents Directory with `UserDefaults`
- Forms
- Sheets
- `Codable`
- `URLSession`

## Day 1

- Adding conformance of Comparable Protocol for custom types
- Writting data to the documents directory using the FileManager
- Switching view states using Enums

## Day 2

- Integrating MapKit with SwiftUI
- Communicating with MapKit Coordinator and using MapKit Annotations
- Integrating TouchID and FaceID with SwiftUI

## Day 3

- Working on advanced MapView concepts:  `MKPointAnnotations` using Custom Bindings
- Customising MKMapView annotations and showing details of the annotations with the help of custom alert

## Day 4

- Extending existing types to support ObservableObject
- Downloading data using URLSession from the Wikipedia API
- Sorting downloaded data by conforming the type to Comparable protocol

## Day 5

- Conforming class to MKPointAnnotation and Codable
- Loading, saving and writing Codable data to the documents directory with complete file protection
- Authenticating user using FaceID and TouchID to unlock data

## Day 6
### Challenges

>1. Our + button is rather hard to tap. Try moving all its modifiers to the image inside the button – what difference does it make, and can you think why?

This is because the modifiers move the image instead of the button.

>2. Having a complex if condition in the middle of ContentView isn’t easy to read – can you rewrite it so that the MapView, Circle, and Button are part of their own view? This might take more work than you think!

Added new view for `MapView`, `Circle`, and `Button`.

>3. Our app silently fails when errors occur during biometric authentication. Add code to show those errors in an alert, but be careful: you can only add one alert() modifier to each view.

Added variables and `Alert` to Content View. When the biometric authentication fails, the user receives an alert.
