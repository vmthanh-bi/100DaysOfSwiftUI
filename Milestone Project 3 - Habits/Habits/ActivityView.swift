//
//  ActivityView.swift
//  Habits
//
//  Created by Tony Vu on 10/29/21.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct ActivityView: View {
    var name: String
    var description: String
    var category: String
    var completion: Int
    var color: Color
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Text(name)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                    .padding(.horizontal)
                
                Text(description)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(color.opacity(0.5))
            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
            
            ZStack {
                VStack {
                    Text(category)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .background(color.opacity(0.7))
                        .clipShape(Capsule())
                    
                    Text("\(completion)")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            }
            .frame(minWidth: 100, maxHeight: 100)
            .background(color.opacity(0.8))
            .cornerRadius(20, corners: [.topRight, .bottomRight])
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(name: "SwiftUI lessons", description: "Finish 100 days", category: "Travel", completion: 11, color: .red)
    }
}
