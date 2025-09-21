//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

struct ListingImageCarouselView: View {

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
		TabView {
			ForEach(images, id: \.self) { image in
				Image(image)
					.resizable()

			}
		}
		.tabViewStyle(.page)
	}
}

#Preview {
	ListingImageCarouselView()
}
