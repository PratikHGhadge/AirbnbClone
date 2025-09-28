//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

struct ListingImageCarouselView: View {

	let images: [String]

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
	ListingImageCarouselView(images: ["listing-1", "listing-2", "listing-3"])
}
