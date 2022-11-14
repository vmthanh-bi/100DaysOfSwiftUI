//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Tony Vu on 11/8/22.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Challenge 1: Text for photo credit over the image.
                ZStack {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(resort.imageCredit)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.white.opacity(0.2))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .padding(.top, 7)
                }
                
                ZStack {
                    VStack {
                        HStack {
                            if sizeClass == .compact && typeSize > .large {
                                VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                                VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                            } else {
                                ResortDetailsView(resort: resort)
                                SkiDetailsView(resort: resort)
                            }
                        }
                        .padding(.vertical)
                        
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                        
                        Group {
                            Text(resort.description)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("Facilities")
                                .font(.headline)
                                .padding(.top)
                            
                            HStack {
                                ForEach(resort.facilityTypes) { facility in
                                    Button {
                                        selectedFacility = facility
                                        showingFacility = true
                                    } label: {
                                        facility.icon
                                            .font(.title)
                                    }
                                }
                            }
                            
                            Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                                if favorites.contains(resort) {
                                    favorites.remove(resort)
                                } else {
                                    favorites.add(resort)
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .background(Color.primary.opacity(0.1))
                .ignoresSafeArea()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
