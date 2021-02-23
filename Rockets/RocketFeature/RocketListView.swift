//
//  RocketListView.swift
//  Rockets
//
//  Created by Suto, Evelyne on 22/02/2021.
//

import SwiftUI

struct RocketListView: View {
    @ObservedObject var viewModel = RocketListViewModel(rocketAPI: RocketDataLoader(url: URL(string: "https://api.spacexdata.com/v3/rockets")!),
                                                        cacheAPI: RocketCacheDataLoader())
    
    var body: some View {
        List(viewModel.rocketVMs, id: \.self) { rocketVM in
            NavigationLink(destination: RocketDetailView(rocketVM: rocketVM)) {
                RocketRowView(rocketVM: rocketVM)
            }
        }.navigationBarTitle("Rockets")
        .onAppear {
            viewModel.fetchRocketsData()
        }
    }
}
