//
//  ContentView.swift
//  Ruler
//
//  Created by goemon12 on 2021/07/05.
//

import SwiftUI

struct ContentView: View {
    @State var sc_w: CGFloat = 0.0
    @State var sc_h: CGFloat = 0.0
    @State var ppmm: CGFloat = 0.0
    @State var ppin: CGFloat = 0.0
    @State var start: CGFloat = 0.0
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(white: 1.0, alpha: 0.5)
    }
    
    func pt2mm(pt: CGFloat) -> CGFloat {
        return (pt - start) / ppmm
    }
    
    func pt2in(pt: CGFloat) -> CGFloat {
        return (pt - start) / ppin
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Path {path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: sc_w / 2, y: 0))
                    path.addLine(to: CGPoint(x: sc_w / 2, y: sc_h))
                    path.addLine(to: CGPoint(x: 0, y: sc_h))
                }
                .fill(Color.black)
                
                Path {path in
                    path.move(to: CGPoint(x: sc_w / 2, y: 0))
                    path.addLine(to: CGPoint(x: sc_w, y: 0))
                    path.addLine(to: CGPoint(x: sc_w, y: sc_h))
                    path.addLine(to: CGPoint(x: sc_w / 2, y: sc_h))
                }
                .fill(Color.white)

                ForEach(Int(pt2mm(pt: 0)) ..< Int(pt2mm(pt: sc_h))) {i in
                    if (i % 10 == 0) {
                        Path {path in
                            path.move(to: CGPoint(x: 0, y: 100 + CGFloat(i) * ppmm))
                            path.addLine(to: CGPoint(x: 100, y: 100 + CGFloat(i) * ppmm))
                        }
                        .stroke(Color.white)
                    }
                    else {
                        Path {path in
                            path.move(to: CGPoint(x: 0, y: 100 + CGFloat(i) * ppmm))
                            path.addLine(to: CGPoint(x: 50, y: 100 + CGFloat(i) * ppmm))
                        }
                        .stroke(Color.white)
                    }
                }
                
                VStack {
                    Spacer()
                    Text("2021 Goemon Software")
                        .font(.headline)
                        .padding()
                        .background(Color.white)
                }
                
                NendView()
                    .edgesIgnoringSafeArea(.all)
            }
            .onAppear {
                sc_w = UIScreen.main.bounds.width
                sc_h = UIScreen.main.bounds.height
                ppmm = sqrt(sc_w * sc_w + sc_h * sc_h) / (6.1 * 25.4) //1.0mmのpt数
                ppin = sqrt(sc_w * sc_w + sc_h * sc_h) / (6.1 * 10.0) //0.1inのpt数
                start = sc_w / 2
            }
            
            .navigationTitle("定規(Ruler)V1.7")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                NavigationLink("設定", destination: SetupView())
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
