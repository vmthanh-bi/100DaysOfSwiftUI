//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Tony Vu on 11/16/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var sortDescriptor: [NSSortDescriptor] = []
    @State private var predicateSelected: Predicates = .containsIgnoreCase
    @State private var filterKey = "lastName"
    @State private var filterValue = "A"
    @State private var sortSelected = ""
    @State private var filterSelected = "S"
    
    let sortTypes = ["None", "First name", "Last name"]
    let filterTypes = ["None", "Last on S", "First with A"]

    var body: some View {
        GeometryReader { geo in
            VStack {
                FilteredList(descriptorArray: sortDescriptor,  predicate: predicateSelected, filterKey: filterKey, filterValue: filterValue) { (singer: Singer) in
                    Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                }
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding()
                
                Button("Add Examples") {
                    let taylor = Singer(context: self.moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"
                    
                    let ed = Singer(context: self.moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
                    
                    let adele = Singer(context: self.moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"
                    
                    try? self.moc.save()
                }
                .foregroundColor(.white)
                .font(.body.weight(.light))
                .padding()
                .frame(width: geo.size.width * 0.9 - 20, height: 30)
                .background(.blue)
                .clipShape(Capsule())
                .frame(width: geo.size.width * 0.9, height: 50)
                .background(.blue.opacity(0.4))
                .clipShape(Capsule())
                
                HStack {
                    HStack(){
                        Text("Sort by :")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                        Picker("Sort", selection: $sortSelected) {
                            ForEach(sortTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .offset(y: 1)
                    }
                    .frame(width: geo.size.width * 0.6, height: 30)
                    .background(.orange)
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button("Sort") {
                        switch sortSelected {
                        case "First name":
                            sortDescriptor = [NSSortDescriptor(key: "firstName", ascending: true)]
                        case "Last name":
                            sortDescriptor = [NSSortDescriptor(key: "lastName", ascending: true)]
                        default:
                            sortDescriptor = [NSSortDescriptor(key: "firstName", ascending: true), NSSortDescriptor(key: "lastName", ascending: true)]
                        }
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .font(.body.weight(.light))
                .frame(width: geo.size.width * 0.9 - 20, height: 30)
                .background(.orange.opacity(0.6))
                .clipShape(Capsule())
                .frame(width: geo.size.width * 0.9, height: 50)
                .background(.orange.opacity(0.4))
                .clipShape(Capsule())
                
                HStack {
                    HStack {
                        Text("Filter names by :")
                            .font(.body)
                            .fontWeight(.light)
                        Picker("Filter", selection: $filterSelected) {
                            ForEach(filterTypes, id: \.self) {
                                Text($0)
                            }
                            .pickerStyle(MenuPickerStyle())
                            .offset(y: 1)
                        }
                    }
                    .frame(width: geo.size.width * 0.6, height: 30)
                    .background(.green)
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    Button("Filter") {
                        switch filterSelected {
                        case "Last names on S":
                            predicateSelected = .beginsWith
                            filterKey = "lastName"
                            filterValue = "S"
                        case "First names containing A":
                            predicateSelected = .contains
                            filterKey = "firstName"
                            filterValue = "A"
                        default:
                            predicateSelected = .containsIgnoreCase
                            filterKey = "lastName"
                            filterValue = "S"
                        }
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .font(.body.weight(.light))
                .frame(width: geo.size.width * 0.9 - 20, height: 30)
                .background(.green.opacity(0.6))
                .clipShape(Capsule())
                .frame(width: geo.size.width * 0.9, height: 50)
                .background(.green.opacity(0.4))
                .clipShape(Capsule())
            }
            .background(.secondary)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
