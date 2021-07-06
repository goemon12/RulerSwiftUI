//
//  ContentView.swift
//  Ruler
//
//  Created by goemon12 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Path {path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
            }
            .fill(Color.red)
            
            Path {path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 300, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.closeSubpath()
            }
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineJoin: .round))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
