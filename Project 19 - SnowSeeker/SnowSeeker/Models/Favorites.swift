//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Tony Vu on 11/8/22.
//


import Foundation

class Favorites: ObservableObject {
    static let favoritesList = "favorites.json"
    private var resorts: Set<String>
    private let saveKey = "Favorites"

    init() {
        // Challenge 2: Load our saved data
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(Favorites.favoritesList)
        
        if (try? Data(contentsOf: url)) != nil {
            resorts = FileManager.default.decode(Favorites.favoritesList)
        } else {
            resorts = []
        }
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // Challenge 2: Save our data
        FileManager.default.encode(resorts, Favorites.favoritesList)
    }
}
