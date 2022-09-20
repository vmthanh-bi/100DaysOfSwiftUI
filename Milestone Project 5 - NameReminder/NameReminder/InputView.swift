//
//  InputView.swift
//  NameReminder
//
//  Created by Tony Vu on 12/3/21.
//

import SwiftUI

struct InputView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var observedUser: ObservedUser
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            Form {
                HStack {
                    Spacer()

                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .padding()
                    
                    Spacer()
                }
                .listRowSeparator(.hidden)
                
                TextField("Enter name", text: $observedUser.user.name)
                    .foregroundColor(Color.black.opacity(0.75))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).opacity(0.2))
                    .padding(.bottom)
                
                TextField("Leave a memo for \(observedUser.user.name)!", text: $observedUser.user.memo)
                    .foregroundColor(Color.black.opacity(0.75))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).opacity(0.2))
                    .padding(.bottom)
            }
            .navigationTitle("Add person")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .onAppear(perform: loadImage)
    }
    
    private func loadImage() {
        guard let inputImage = observedUser.user.image else { return }
        image = Image(uiImage: inputImage)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(observedUser: ObservedUser(user: User(inputName: "Test Name", inputMemo: "Cool dude", inputImage: UIImage(named: "halo")!)))
    }
}
