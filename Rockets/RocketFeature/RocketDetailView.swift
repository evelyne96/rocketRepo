//
//  RocketDetailView.swift
//  Rockets
//
//  Created by Suto, Evelyne on 22/02/2021.
//

import SwiftUI

struct RocketDetailView: View {
    @ObservedObject var rocketVM: RocketViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: rocketVM.image)
                    .resizable()
                    .scaledToFit()
                Spacer()
                VStack(alignment: .center, spacing: 15) {
                    Text("Success Rate: \(rocketVM.successRatePct)")
                        .font(Font.rocketDetailFont)
                    Text("First Flight: \(rocketVM.firstFlight)")
                        .font(Font.rocketDetailFont)
                    Text(rocketVM.description)
                        .font(Font.rocketDetailFont)
                }
                Spacer()
            }
        }.navigationTitle(rocketVM.name)
    }
}
