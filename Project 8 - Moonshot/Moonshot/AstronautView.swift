//
//  AstronautView.swift
//  Moonshot
//
//  Created by Tony Vu on 10/22/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Divider()
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .frame(maxWidth: geometry.size.width)
                        .background(Color.primary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding()
                        .layoutPriority(1)
                    
                    Divider()
                        .frame(width: geometry.size.width * 0.7)
                        .padding(.bottom)
                    
                    HStack {
                        Text("Missions Flown")
                            .padding(10)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                        
                        Text("\(self.missions.count)")
                            .padding(.vertical, 10)
                            .padding(.trailing, 10)
                    }
                    .background(Color.primary.opacity(0.1))
                    .clipShape(Capsule())
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                    
                    ForEach(self.missions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 66, height: 66)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .background(Color.primary.opacity(0.1))
                        .frame(width: geometry.size.width * 0.7)
                        .clipShape(Capsule())
                        .padding(.horizontal, 20)
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        var missionsFlown = [Mission]()
        let allMissions: [Mission] = Bundle.main.decode("missions.json")
        
        for mission in allMissions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                missionsFlown.append(mission)
            }
        }
        
        self.missions = missionsFlown
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let mission: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: mission)
    }
}
