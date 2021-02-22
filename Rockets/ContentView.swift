//
//  ContentView.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RocketListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.rockets, id: \.self) { rocket in
                NavigationLink(destination: RocketDetailView(rocketVM: rocket)) {
                    RocketRowView(rocketVM: rocket)
                }
            }.navigationBarTitle("Rockets")
            .onAppear {
                viewModel.fetchRocketsData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
