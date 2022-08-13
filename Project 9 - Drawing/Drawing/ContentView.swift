//
//  ContentView.swift
//  Drawing
//
//  Created by Tony Vu on 10/28/21.
//

import SwiftUI

struct Arrow: InsettableShape {
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rectWidth: CGFloat = rect.midX/4
        let triBase: CGFloat = 3/4 * rect.midX
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - rectWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + rectWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + rectWidth, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX + triBase, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX - triBase, y: rect.midY))
        
        path.addLine(to: CGPoint(x: rect.midX - rectWidth, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - rectWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + rectWidth, y: rect.maxY))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
        var steps = 100

        var body: some View {
            ZStack {
                ForEach(0..<steps) { value in
                    Rectangle()
                        .inset(by: CGFloat(value))
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                            self.color(for: value, brightness: 1),
                            self.color(for: value, brightness: 0.2)
                            ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                }
            }
        }

        func color(for value: Int, brightness: Double) -> Color {
            var targetHue = Double(value) / Double(self.steps) + self.amount

            if targetHue > 1 {
                targetHue -= 1
            }

            return Color(hue: targetHue, saturation: 1, brightness: brightness)
        }
}

struct ContentView: View {
    @State private var thickness: CGFloat = 1
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            Arrow()
                .strokeBorder(Color.red, lineWidth: thickness)
                .frame(width: 250, height: 250)
                .padding(.bottom)
            
            Text("Thickness")
            Slider(value: $thickness, in: 1...30)
                .padding(.horizontal)
                .padding(.bottom)
            
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 250, height: 250)
                .padding(.bottom)
            
            Text("Color")
            Slider(value: $colorCycle)
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
