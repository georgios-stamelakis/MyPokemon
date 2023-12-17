//
//  MainTabView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var isLocationPresented = false
    @State private var isProfilePresented = false

    var body: some View {
        VStack {

            // Top Bar
            HStack {
                // Location Button
                Button(action: {
                    isLocationPresented.toggle()
                }) {
                    Image(systemName: "location.fill")
                        .padding()
                }
                .sheet(isPresented: $isLocationPresented) {
                    LocationView()
                }

                Spacer()

                // Sign In/Profile Button
                Button(action: {
                    isProfilePresented.toggle()
                }) {
                    Image(systemName: "person.fill")
                        .padding()
                }
                .sheet(isPresented: $isProfilePresented) {
                    ProfileView()
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)

            // Tab View
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
}

struct LocationView: View {
    var body: some View {
        // Replace with your location view content
        Text("Location View")
            .foregroundColor(.black)
    }
}

struct ProfileView: View {
    var body: some View {
        // Replace with your profile view content
        Text("Profile View")
            .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
