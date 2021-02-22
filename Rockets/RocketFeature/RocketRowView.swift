//
//  RocketRowView.swift
//  Rockets
//
//  Created by Suto, Evelyne on 21/02/2021.
//

import SwiftUI

struct RocketRowView: View {
    @ObservedObject var rocketVM: RocketViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: rocketVM.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            VStack(alignment: .leading, spacing: 15) {
                Text(rocketVM.name)
                    .font(Font.rocketTitleFont)
                Text("Success Rate: \(rocketVM.successRatePct)")
                    .font(Font.rocketDetailFont)
                Text("First Flight: \(rocketVM.firstFlight)")
                    .font(Font.rocketDetailFont)
            }
        }
    }
}
