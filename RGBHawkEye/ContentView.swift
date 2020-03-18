//
//  ContentView.swift
//  RGBHawkEye
//
//  Created by wxm on 2020/3/16.
//  Copyright © 2020 wxm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    在结构体ContentView里面，在body闭包的上面添加如下属性:
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    var body: some View {
//        Text("Hello, World!")
        VStack {
            HStack {
                 // Target color block
                  VStack {
//                    Rectangle()
                    Rectangle()
                    .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))

                    Text("Match this color")
                  }
                  // Guess color block
                  VStack {
//                    Rectangle()
                    Rectangle()
                    .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))

                    HStack {
                      Text("R: \(Int(rGuess*255))  ")
                      Text("G: \(Int(gGuess*255))  ")
                      Text("B: \(Int(bGuess*255))  ")
                    }
                  }
            }
//            Text("Hit me button")
            Button(action:{
                self.showAlert = true
                
            }){
                Text("Hit me")
            }
            
            .alert(isPresented: $showAlert){
                Alert(title:   Text("Your score:"), message:Text("\(computeScore())"))
            }
            VStack {
                HStack{
                Text("0").foregroundColor(.red)
                    Slider(value:$rGuess)
                    Text("255").foregroundColor(.red)
                }.padding()
                
                HStack{
                    Text("0").foregroundColor(.green)
                    Slider(value:$gGuess)
                    Text("255").foregroundColor(.green)
                }.padding()
                
                HStack{
                    Text("0").foregroundColor(.blue)
                    Slider(value:$bGuess)
                    Text("255").foregroundColor(.blue)
                }.padding()
                
            }
        }
        
    }
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * gDiff + bDiff*bDiff + gDiff*gDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
