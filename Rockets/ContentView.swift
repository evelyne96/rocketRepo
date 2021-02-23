//
//  ContentView.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            RocketListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
