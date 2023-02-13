//
//  ContentView.swift
//  trafficLightOnSwiftUI
//
//  Created by dzmitry on 13.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var opacityRed = 0.001
    @State private var opacityYellow = 0.001
    @State private var opacityGreen = 0.001
    
    @State private var count = 0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                RedYellowGreenView().redCircle.foregroundColor(Color(red: 255,
                                                                     green: 0,
                                                                     blue: 0,
                                                                     opacity: opacityRed))
                RedYellowGreenView().yellowCircle.foregroundColor(Color(red: 255,
                                                                        green: 255,
                                                                        blue: 0,
                                                                        opacity: opacityYellow))
                RedYellowGreenView().greenCircle.foregroundColor(Color(red: 0,
                                                                       green: 255,
                                                                       blue: 0,
                                                                       opacity: opacityGreen))
                Spacer()
                Button(action: {
                    changeOpacity() }, label: {
                    if opacityRed == 1.0 || opacityYellow == 1.0 || opacityGreen == 1.0 {
                        Text("NEXT")
                    } else {
                        Text("Start")
                    }
                })
                .frame(width: 140, height: 50)
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
                .background(Color.blue).cornerRadius(15)
            }
            .padding(.top, 20)
            .padding(.bottom, 50)
            .onAppear { timer() }
        }
    }
    
    private func timer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation {
                self.changeOpacity()
                if self.count >= 4 {
                    self.count = 0
                }
            }
        }
    }

    private func changeOpacity() {
        switch count {
        case 0:
            opacityRed = 1.0
            opacityYellow = 0.001
            opacityGreen = 0.001
            count = 1
        case 1:
            opacityRed = 1.0
            opacityYellow = 1.0
            opacityGreen = 0.001
            count = 2
        case 2:
            opacityRed = 0.001
            opacityYellow = 0.001
            opacityGreen = 1.0
            count = 3
        case 3:
            opacityRed = 0.001
            opacityYellow = 1.0
            opacityGreen = 0.001
            count = 0
        default: break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
