# Project 10 - CupcakeCorner

This project is a multi-screen app for ordering cupcakes. 

Day 49: https://www.hackingwithswift.com/100/swiftui/49

## Topics

- Codable
- Sending HTTP POST Requests using URLSession
- `disabled()`
- CodingKey Protocol

## Day 1

- Adding Codable conformance to @Published properties
- Sending and receiving codable data with URLSession and SwiftUI
- Validating and disabling forms

## Day 2

- Entering basic cupcake details
- Adding user information for delivery address
- Preparing for checkout of the cupcake delivery

## Day 3

- Encoding and Decoding the ObservedObject class object using CodingKeys
- Sending a POST HTTP Networking Request using URLSession

## Day 4
### Challenges

>1. Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.

Created an extension of String, to check for the empty spaces in all the String. The empty space string validation was added to the hasValidAddress bool so that address fields can be more validated.

>2. If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.

Transformed the previous print errors to alerts so the user is notified about the request.

>3. For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.

Created a new class with ObservableObject and inserted the data struct of it with @Published.

## Screenshots

<img src="Screenshots/Screenshot 1.png" width="300"/> <img src="Screenshots/Screenshot 2.png" width="300"/> 
<img src="Screenshots/Screenshot 3.png" width="300"/> <img src="Screenshots/Screenshot 4.png" width="300"/>
<img src="Screenshots/Screenshot 5.png" width="300"/> <img src="Screenshots/Screenshot 6.png" width="300"/> 
