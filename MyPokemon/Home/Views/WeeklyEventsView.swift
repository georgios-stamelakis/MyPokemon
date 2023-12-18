//
//  WeeklyEventsView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct WeeklyEventsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Events for This Week")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { index in // Replace with the actual number of events
                        WeeklyEventCardView(eventName: "Event \(index + 1)", date: "Dec \(index + 1), 2023", location: "Event Location \(index + 1)")
                    }
                }
                .padding()
            }
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding()
    }
}

struct WeeklyEventCardView: View {
    var eventName: String
    var date: String
    var location: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Event Card Content
            Text(eventName)
                .font(.headline)
                .fontWeight(.bold)

            Text(date)
                .foregroundColor(.gray)

            Text(location)
                .foregroundColor(.gray)
        }
        .frame(width: 200, height: 150) // Adjust the size of each event card
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

struct WeeklyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyEventsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
