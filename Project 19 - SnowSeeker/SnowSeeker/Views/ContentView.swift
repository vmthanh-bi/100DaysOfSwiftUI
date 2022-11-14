//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tony Vu on 10/26/22.
//

import SwiftUI

//extension View {
//    @ViewBuilder func phoneOnlyNavigationView() -> some View {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            self.navigationViewStyle(.stack)
//        } else {
//            self
//        }
//    }
//}

enum SortBy {
    case alphabetical, country, none
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    // Challenge 3: Required variables
    @State private var isShowingSortSheet = false
    @State private var sortBy: SortBy = .none

    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }

                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            // Challenge 3: Button for sort options in toolbar.
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Sort") {
                        isShowingSortSheet = true
                    }
                }
            }
            // Challenge 3: Action sheet for sort options.
            .actionSheet(isPresented: $isShowingSortSheet) {
                ActionSheet(title: Text("Sort Resorts"), buttons: [
                    .default(Text("By name")) {
                        sortBy = .alphabetical
                    },
                    .default(Text("By country")) {
                        sortBy = .country
                    },
                    .default(Text("Default")) {
                        sortBy = .none
                    }
                ])
            }

            WelcomeView()
        }
        .environmentObject(favorites)
    }

    // Challenge 3: New array for the resorts list after being sorted and filtered.
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            switch sortBy {
            case .none:
                return resorts
            case .alphabetical:
                return resorts.sorted { $0.name < $1.name }
            case .country:
                return resorts.sorted { $0.country < $1.country }
            }
        } else {
            switch sortBy {
            case .none:
                return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            case .alphabetical:
                return resorts
                    .sorted { $0.name < $1.name }
                    .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            case .country:
                return resorts
                    .sorted { $0.country < $1.country }
                    .filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
