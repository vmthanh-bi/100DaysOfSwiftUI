//
//  ContentView.swift
//  Habits
//
//  Created by Tony Vu on 10/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink(destination: DetailView(activities: activities, habitUUID: item.id, color: self.getColor(of: item.category))) {
                        ActivityView(name: item.name, description: item.description, category: item.category, completion: item.completion, color: self.getColor(of: item.category))
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: remove)
            }
            .navigationBarTitle("My Habits")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingSheet = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingSheet) {
                AddView(activities: self.activities)
            }
        }
    }
    
    func remove(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
    
    func getColor(of category: String) -> Color {
        switch category {
        case "Work":
            return .red
        case "Health":
            return .green
        case "Sport":
            return .blue
        case "Fun":
            return .purple
        case "Travel":
            return .orange
        default:
            return .gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
