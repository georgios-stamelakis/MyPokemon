//
//  FeaturedEventView.swift
//  MyPokemon
//
//  Created by Georgios Stamelakis on 17/12/23.
//

import SwiftUI

struct FeaturedEventView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Featured Event Image
            Image("FeaturedEvent")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .clipped()

            // Event Details
            VStack(alignment: .leading, spacing: 8) {
                Text("Featured Event Name")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Date: December 31, 2023")
                    .foregroundColor(.gray)

                Text("Location: Your Event Location")
                    .foregroundColor(.gray)
            }
            .padding()

            // Additional Event Description or Details
            Text("Description or additional details about the featured event can go here.")
                .foregroundColor(.black)
                .padding(.horizontal)

            Spacer()
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding()
    }
}

struct FeaturedEventView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedEventView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
