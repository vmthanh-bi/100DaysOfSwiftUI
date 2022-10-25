//
//  ContentView.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DiceView()
                .tabItem {
                    Image(systemName: "cube")
                    Text("Roll Dice")
                }
                    
            StatsView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Statistics")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
