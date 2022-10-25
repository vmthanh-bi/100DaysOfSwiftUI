//
//  ContentView.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import SwiftUI
import CoreData

struct StatsView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.date, ascending: true)],
                  animation: .default)
    
    private var diceStats: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary.edgesIgnoringSafeArea(.all)
                
                List(diceStats, id: \.self) { stats in
                    DiceStatView(rollStats: stats)
                        .listRowBackground(Color.black)
                }
                .background(Color.black)
                .scrollContentBackground(.hidden)
                .navigationTitle("Statistics")
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
