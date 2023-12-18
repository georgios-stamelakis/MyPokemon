//
//  HomeView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                Spacer()

                FeaturedEventView()

                Spacer()

                WeeklyEventsView()

                Spacer()

                ShowcaseView()

                Spacer()

            }
        }
    }
}

#Preview {
    HomeView()
}
