//
//  RedYellowGreenView.swift
//  trafficLightOnSwiftUI
//
//  Created by dzmitry on 13.02.23.
//

import SwiftUI

struct RedYellowGreenView: View {
    var redCircle: some View {
        setCircle()
    }

    var yellowCircle: some View {
        setCircle()
    }

    var greenCircle: some View {
        setCircle()
    }

    var body: some View {
        VStack {
            redCircle
            yellowCircle
            greenCircle
        }
    }

    // MARK: Private

    private func setCircle() -> some View {
        return Circle()
            .frame(width: 155, height: 155)
            .overlay(Circle().stroke(.white, lineWidth: 3))
    }
}

struct RedYellowGreenView_Previews: PreviewProvider {
    static var previews: some View {
        RedYellowGreenView()
    }
}
