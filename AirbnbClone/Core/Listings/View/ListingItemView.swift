//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

struct ListingItemView: View {
	let listing: Listing

	var body: some View {
		VStack(spacing: 8) {
			// Images
			ListingImageCarouselView(images: listing.imageURLs)
			.frame(height: 320)
			.clipShape(RoundedRectangle(cornerRadius:10))

			// Listing details

			HStack(alignment: .top) {
				// Details
				VStack(alignment: .leading) {
					Text("\(listing.city) \(listing.state)")
						.fontWeight(.semibold)

					Text("10 km away")
						.foregroundStyle(.gray)

					Text("Sep 20 - Oct 3")
						.foregroundStyle(.gray)

					HStack(spacing: 4) {
						Text("$ \(listing.pricePerNight)")
							.fontWeight(.semibold)
						Text("night")
					}

				}

				Spacer()

				// Rating
				HStack(spacing: 2) {
					Image(systemName: "star.fill")
					Text("\(listing.rating.formatted())")

				}
			}
			.font(.footnote)
			.foregroundColor(.black)

		}
		.padding()
	}
}

#Preview {
	ListingItemView(listing: DeveloperPreview.shared.listings[0])
}


