//
//  Prospects.swift
//  HotProspects
//
//  Created by Tony Vu on 4/1/22.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    // Set when contact was added
    var dateAdded = Date.now
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    let saveKey = "SavedData"
    let fileManager = LocalFileManagerJSON(folderName: "HotProspects", appFolder: .documentDirectory)
    
    init() {
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
        // Load from documents folder
        if let data = fileManager.getJSON(name: saveKey, dataType: [Prospect()]) {
            people = data
            return
        }
        
        
        // no saved data
        people = []
    }
    
    private func save() {
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
        // Save to documents folder
        fileManager.saveJSON(name: saveKey, data: people)
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    //Sorting functions
    
    func sortDate(ascendingOrder: Bool) {
        if ascendingOrder {
            people.sort { $0.dateAdded < $1.dateAdded }
        } else {
            people.sort { $0.dateAdded > $1.dateAdded }
        }
    }
    
    func sortName(ascendingOrder: Bool) {
        if ascendingOrder {
            people.sort { $0.name < $1.name }
        } else {
            people.sort { $0.name > $1.name }
        }
    }
    
    func sortEmail(ascendingOrder: Bool) {
        if ascendingOrder {
            people.sort { $0.emailAddress < $1.emailAddress }
        } else {
            people.sort { $0.emailAddress > $1.emailAddress }
        }
    }
    
}
