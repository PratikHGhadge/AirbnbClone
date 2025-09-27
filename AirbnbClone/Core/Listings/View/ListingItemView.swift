//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

struct ListingItemView: View {

	var images = [
		"listing-1",
		"listing-2",
		"listing-3",
		"listing-4",
		"listing-5",
		"listing-6",
		"listing-7",
		"listing-8",
		"listing-9",
		"listing-10"
	]

	var body: some View {
		VStack(spacing: 8) {
			// Images
			ListingImageCarouselView()
			.frame(height: 320)
			.clipShape(RoundedRectangle(cornerRadius:10))

			// Listing details

			HStack(alignment: .top) {
				// Details
				VStack(alignment: .leading) {
					Text("Midtown Suite")
						.fontWeight(.semibold)

					Text("10 km away")
						.foregroundStyle(.gray)

					Text("Sep 20 - Oct 3")
						.foregroundStyle(.gray)

					HStack(spacing: 4) {
						Text("$ 567")
							.fontWeight(.semibold)
						Text("night")
					}

				}

				Spacer()

				// Rating
				HStack(spacing: 2) {
					Image(systemName: "star.fill")
					Text("4.7")

				}
			}
			.font(.footnote)
			.foregroundColor(.black)

		}
		.padding()
	}
}

#Preview {
	ListingItemView()
}


