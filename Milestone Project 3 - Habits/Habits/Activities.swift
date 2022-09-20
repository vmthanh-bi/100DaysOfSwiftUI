//
//  Activities.swift
//  Habits
//
//  Created by Tony Vu on 10/28/21.
//

import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var category: String
    var completion: Int
}

class Activities: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "activities") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
    func getActivity(withID habitID: UUID) -> Habit? {
        return items.first { (item) -> Bool in
            item.id == habitID
        }
    }
    
    func updateActivities(for activity: Habit) {
        let index = items.firstIndex(where: { $0.id == activity.id })
        
        if let i = index {
            items[i] = activity
        }
    }
}
