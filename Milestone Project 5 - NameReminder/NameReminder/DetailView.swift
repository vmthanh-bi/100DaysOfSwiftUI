//
//  DetailView.swift
//  NameReminder
//
//  Created by Tony Vu on 12/16/21.
//

import SwiftUI

struct DetailView: View {
    let user: User
    @State var image: Image?
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MapView(pictureLocation: user.location)
                                .edgesIgnoringSafeArea(.top)
                                .frame(height: 400)
                
                
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.4))
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    
                    Rectangle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    
                    Spacer()
                    
                    VStack {
                        Text(user.name == "" ? "Unknown" : "\(user.name)")
                            .font(.title)
                            .padding()
                            .frame(minWidth: 200, minHeight: 50)
                            .foregroundColor(.white)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Capsule())
                            .padding(.top)
                        
                        Text(user.memo == "" ? "You did not leave a memo for this person." : "\(user.memo)")
                            .foregroundColor(.white)
                            .frame(minHeight: 50)
                        
                        Divider()
                            .frame(width: 200)
                        
                        Text("Met at")
                            .font(.caption)
                            .foregroundColor(.black.opacity(0.75))
                        if user.location?.latitude != 0.0 {
                            Text("Latitude: \(user.location?.latitude ?? 0) Longitude: \(user.location?.longitude ?? 0)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        } else {
                            Text("Unknown")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.2))
                .edgesIgnoringSafeArea(.bottom)
                
            }
            self.getImage(of: user)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 5).opacity(0.75))
                .offset(y: 70)
        }
    }
    
    private func getImage(of user: User) -> Image {
        guard let image = user.image else {
            return Image(systemName: "person")
        }
        
        return Image(uiImage: image)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User())
    }
}
