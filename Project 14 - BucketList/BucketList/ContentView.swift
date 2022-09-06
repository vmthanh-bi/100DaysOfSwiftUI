//
//  ContentView.swift
//  BucketList
//
//  Created by Tony Vu on 11/25/21.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct ContentView: View {
//    @State private var centerCoordinate = CLLocationCoordinate2D()
//    @State private var locations = [CodableMKPointAnnotation]()
//    @State private var selectedPlace: MKPointAnnotation?
//    @State private var showingPlaceDetails = false
//    @State private var showingEditScreen = false
    @State private var isUnlocked = false
    
    @State private var showingAuthenticationAlert = false
    @State private var authenticationAlertTitle = ""
    @State private var authenticationAlertMsg = ""
    
    var body: some View {
        ZStack {
            if isUnlocked {
                UnlockedView()
//                MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
//                    .edgesIgnoringSafeArea(.all)
//                Circle()
//                    .fill(Color.blue)
//                    .opacity(0.3)
//                    .frame(width: 32, height: 32)
//
//                VStack {
//                    Spacer()
//
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            let newLocation = CodableMKPointAnnotation()
//                            newLocation.title = "Example location"
//                            newLocation.coordinate = self.centerCoordinate
//                            self.locations.append(newLocation)
//
//                            self.selectedPlace = newLocation
//                            self.showingEditScreen = true
//                        }) {
//                            Image(systemName: "plus")
//                                .padding()
//                                .background(Color.black.opacity(0.75))
//                                .foregroundColor(.white)
//                                .font(.title)
//                                .clipShape(Circle())
//                                .padding(.trailing)
//                        }
//                    }
//                }
            } else {
                Button("Unlock Places") {
                    authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
//        .alert(isPresented: $showingPlaceDetails) {
//            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
//                self.showingEditScreen = true
//                }
//            )
//        }
//        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
//            if self.selectedPlace != nil {
//                EditView(placemark: self.selectedPlace!)
//            }
//        }
//        .onAppear(perform: loadData)
        .alert(isPresented: $showingAuthenticationAlert) {
                    Alert(title: Text(authenticationAlertTitle), message: Text(authenticationAlertMsg), dismissButton: .default(Text("Ok")))
                }
    }

//    func getDocumentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//    func loadData() {
//        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
//        print(filename)
//
//        do {
//            let data = try Data(contentsOf: filename)
//            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
//        } catch {
//            print("Unable to load saved data.")
//        }
//    }
//
//    func saveData() {
//        do {
//            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
//            let data = try JSONEncoder().encode(self.locations)
//            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
//        } catch {
//            print("Unable to save data.")
//        }
//    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your map."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        authenticationAlertTitle = "Authentication Error"
                        authenticationAlertMsg = error?.localizedDescription ?? "An error ocurred while unlocking your map, please try again later."
                        showingAuthenticationAlert = true
                    }
                }
            }
        } else {
            authenticationAlertTitle = "Authentication Failed"
            authenticationAlertMsg = "The biometric authentication was unsuccessful, please try again."
            showingAuthenticationAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
