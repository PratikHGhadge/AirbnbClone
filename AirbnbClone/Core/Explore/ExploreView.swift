//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//


import SwiftUI

struct ExploreVirew: View {
	var body: some View {
		NavigationStack {
			ScrollView {
				SearchAndFilterBar()

				LazyVStack(spacing: 20) {
					ForEach(0 ... 10, id: \.self) { listing in
						NavigationLink(value: listing) {
							ListingItemView()
								.frame(height: 400)
								.clipShape(RoundedRectangle(cornerRadius: 10))
						}
					}
					.padding()
				}
			}
			.navigationDestination(for: Int.self) { listing in
				ListingDetailView()
			}
		}
	}
}

#Preview {
	ExploreVirew()
}

