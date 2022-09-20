//
//  ContentView.swift
//  NameReminder
//
//  Created by Tony Vu on 12/1/21.
//

import SwiftUI

enum ActiveSheet {
    case imagePicker, createContact
}

struct ContentView: View {
    @ObservedObject var users = Users()
    @ObservedObject var observedUser = ObservedUser(user: User())
    @State private var activeSheet: ActiveSheet = .imagePicker
    @State private var showingSheet = false
    @State private var inputImage: UIImage?
    @State private var inputName: String?
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(users.users, id: \.self) { user in
                        NavigationLink(destination: DetailView(user: user)) {
                            HStack {
                                self.getImage(of: user)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                Text(user.name)
                                    .font(.title)
                            }
                        }
                    }
                    .onDelete(perform: remove)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showingSheet = true
                            activeSheet = .imagePicker
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .background(Color.black.opacity(0.75))
                                .foregroundColor(.white)
                                .font(.title)
                                .clipShape(Circle())
                                .padding([.bottom,.trailing])
                        }
                    }
                }
            }
            .navigationTitle("Name Reminder")
            .sheet(isPresented: $showingSheet, onDismiss: dismissSheet) {
                if activeSheet == .imagePicker {
                    ImagePicker(image: $inputImage)
                } else {
                    InputView(observedUser: observedUser)
                }
            }
        }
    }
    
    private func getImage(of user: User) -> Image {
        guard let image = user.image else {
            return Image(systemName: "person")
        }
        
        return Image(uiImage: image)
    }
    
    private func remove(at offsets: IndexSet) {
        users.users.remove(atOffsets: offsets)
        users.saveUsers()
        observedUser.resetUser()
    }
    
    private func dismissSheet() {
         if activeSheet == .imagePicker {
             verifyInputs()
         } else {
             saveNewUser()
         }
     }
     
     private func verifyInputs() {
         guard let inputImage = inputImage else { return }
         observedUser.user.image = inputImage
         observedUser.user.location = locationFetcher.lastKnownLocation
         showingSheet = true
         activeSheet = .createContact
     }
     
     private func saveNewUser() {
         users.users.append(observedUser.user)
         users.saveUsers()
         observedUser.resetUser()
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
