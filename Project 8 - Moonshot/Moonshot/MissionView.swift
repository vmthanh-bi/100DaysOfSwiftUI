//
//  MissionView.swift
//  Moonshot
//
//  Created by Tony Vu on 10/21/21.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    HStack {
                        Text("Launch date")
                            .padding(10)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                            
                        Text((self.mission.formattedLaunchDate))
                            .padding(.vertical, 10)
                            .padding(.trailing, 10)
                    }
                    .background(Color.primary.opacity(0.1))
                    .clipShape(Capsule())
                    .padding(.horizontal, 20)
                    .padding(.bottom)
                    
                    Divider()
                        .frame(width: geometry.size.width * 0.7)
                    
                    Text(self.mission.description)
                        .padding()
                        .frame(maxWidth: geometry.size.width)
                        .background(Color.primary.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal, 20)
                        .padding(.top)
                        
                    Divider()
                        .frame(width: geometry.size.width * 0.7)
                        .padding()
                        
                    ForEach(self.astronauts, id: \.role) { crewMember in NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: [Mission]())) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.secondary, lineWidth: 1))
                                
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name).font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .background(Color.primary.opacity(0.1))
                        .clipShape(Capsule())
                        .padding(.horizontal, 20)
                        
                        Spacer(minLength: 25)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
