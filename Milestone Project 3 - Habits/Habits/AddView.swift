//
//  AddView.swift
//  Habits
//
//  Created by Tony Vu on 10/28/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities = Activities()
    
    @State private var name = ""
    @State private var description = ""
    @State private var category = ""
    
    static let habitCategories = ["Work", "Health", "Sport", "Travel", "Misc."]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name the activity", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Choose category", selection: $category) {
                        ForEach(AddView.habitCategories, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Description")) {
                    TextField("Activity Description", text: $description)
                }
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                let newActivity = Habit(name: self.name, description: self.description, category: self.category, completion: 0)
                self.activities.items.append(newActivity)
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(name.isEmpty || category.isEmpty || description.isEmpty))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
