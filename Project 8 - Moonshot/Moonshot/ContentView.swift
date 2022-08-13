//
//  ContentView.swift
//  Moonshot
//
//  Created by Tony Vu on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showingDate = true
    @State var buttonName = ""
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.showingDate {
                            Text(mission.formattedLaunchDate)
                                .foregroundColor(.secondary)
                        } else {
                            Text(mission.formattedCrew)
                                .foregroundColor(.secondary)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(action: { showingDate.toggle() }, label: { showingDate ? Text("Show Crew Names") : Text("Show Launch Date") }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

