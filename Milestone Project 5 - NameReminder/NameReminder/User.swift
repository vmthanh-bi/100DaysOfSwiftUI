//
//  User.swift
//  NameReminder
//
//  Created by Tony Vu on 12/1/21.
//

import SwiftUI
import Foundation
import CoreLocation

class Users: ObservableObject {
    static let usersList = "usersList.json"
    @Published var users: [User] = []
    
    init() {
        getUsers()
    }
    
    func saveUsers() {
        FileManager.default.encode(users, Users.usersList)
    }
    
    func getUsers() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(Users.usersList)
        guard (try? Data(contentsOf: url)) != nil else { return }
        users = FileManager.default.decode(Users.usersList)
    }
}

class ObservedUser: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func resetUser() {
        user.name = ""
        user.memo = ""
        user.image = nil
    }
}

struct User: Codable, Comparable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    var id = UUID()
    var name: String
    var memo: String
    var locationLatitude: Double?
    var locationLongitude: Double?
    var imageData: Data?
    
    var image: UIImage? {
        get { UIImage(data: imageData ?? Data()) }
        set { imageData = newValue?.jpegData(compressionQuality: 0.8) }
    }
    
    var location: CLLocationCoordinate2D? {
        get {
            CLLocationCoordinate2D(latitude: locationLatitude ?? 0 , longitude: locationLongitude ?? 0)
        }
        set {
            locationLatitude = newValue?.latitude
            locationLongitude = newValue?.longitude
        }
    }
    
    init() {
        self.name = ""
        self.memo = ""
    }
    
    init(inputName: String, inputMemo: String, inputImage: UIImage) {
        self.name = inputName
        self.memo = inputMemo
        self.image = inputImage
    }
}
