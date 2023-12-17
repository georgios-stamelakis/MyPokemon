//
//  MainTabView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Tab 1
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }

            // Tab 2
            Text("Search is Under Construction!")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("SEARCH")
                }

            // Tab 3
            Text("Tickets is Under Construction")
                .tabItem {
                    Image(systemName: "ticket")
                    Text("TICKETS")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
