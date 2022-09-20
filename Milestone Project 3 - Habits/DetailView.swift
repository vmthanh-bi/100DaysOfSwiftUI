//
//  DetailView.swift
//  Habits
//
//  Created by Tony Vu on 11/1/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activities: Activities
    var habitUUID: UUID
    
    var activity: Habit? {
            activities.getActivity(withID: habitUUID)
        }
    
    var color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(color.opacity(0.1))
                .background(color.opacity(0.1))
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 5) {
                    Text(activity?.name ?? "Missing name")
                        .font(.system(size: 50))
                        .foregroundColor(color)
                        .fontWeight(.bold)
                    HStack {
                        Text("Category")
                            .padding(10)
                            .background(color.opacity(0.5))
                            .clipShape(Capsule())
                            
                        Text(activity?.category ?? "Missing category")
                            .padding(.vertical, 10)
                            .padding(.trailing, 10)
                    }
                    .foregroundColor(.white)
                    .background(color.opacity(0.5))
                    .clipShape(Capsule())
                    .padding()
                    
                    Text("Description")
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    
                    Divider()
                        .frame(width: 200)
                    
                    Text(activity?.description ?? "Missing description")
                        .font(.system(size: 30))
                        .fontWeight(.regular)
                        .foregroundColor(.primary.opacity(0.6))
                    
                    VStack(spacing: 0) {
                        VStack {
                            Text("\(activity?.completion ?? 0)")
                                .font(.system(size: 60))
                                .fontWeight(.semibold)
                            Text(activity?.completion == 1 ? "Completion" : "Completions")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(5)
                        .background(color.opacity(0.5))
                        .cornerRadius(20, corners: [.topRight, .topLeft])
                        
                        Button("Add") {
                            addCompletion()
                        }
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(color.opacity(0.8))
                        .cornerRadius(20, corners: [.bottomRight, .bottomLeft])
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: 130)
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(color.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            .offset(y: -20)
        }
    }
    
    func addCompletion() {
        var newActivity = activity
        newActivity?.completion += 1
        
        if let activityToUpdate = newActivity {
            activities.updateActivities(for: activityToUpdate)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activities: Activities(), habitUUID: UUID(), color: .orange)
    }
}
