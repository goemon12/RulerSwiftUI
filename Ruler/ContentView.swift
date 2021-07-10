//
//  ContentView.swift
//  Ruler
//
//  Created by goemon12 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
    @State var mm_px: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0 ..< 100) {i in
                if (i % 10 == 0) {
                    Path {path in
                        path.move(to: CGPoint(x: 0, y: 100 + CGFloat(i) * mm_px))
                        path.addLine(to: CGPoint(x: 100, y: 100 + CGFloat(i) * mm_px))
                    }
                    .stroke(Color.red)
                }
                else {
                    Path {path in
                        path.move(to: CGPoint(x: 0, y: 100 + CGFloat(i) * mm_px))
                        path.addLine(to: CGPoint(x: 50, y: 100 + CGFloat(i) * mm_px))
                    }
                    .stroke(Color.red)
                }
            }
            
            VStack {
                Text("\(mm_px)")
            }
        }
        .onAppear {
            let w = UIScreen.main.bounds.width
            let h = UIScreen.main.bounds.height
            mm_px = sqrt(w * w + h * h) / 6.1 / 25.4
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
