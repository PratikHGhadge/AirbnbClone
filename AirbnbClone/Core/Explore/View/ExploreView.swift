//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//


import SwiftUI

struct ExploreView: View {
	@State private var showDestinationSearchView = true
	@StateObject var viewModel = ExploreViewModel(service: ExploreService())

	var body: some View {
		NavigationStack {
			if showDestinationSearchView {
				DestinationSearchView(
					show: $showDestinationSearchView,
					exploreViewModel: viewModel
				)
			} else {
				ScrollView {
					SearchAndFilterBar()
						.onTapGesture {
							withAnimation(.snappy) {
								showDestinationSearchView.toggle()
							}
						}

					LazyVStack(spacing: 20) {
						ForEach(viewModel.listings) { listing in
							NavigationLink(value: listing) {
								ListingItemView(listing: listing)
									.frame(height: 400)
									.clipShape(RoundedRectangle(cornerRadius: 10))
							}
						}
						.padding()
					}
				}
				.navigationDestination(for: Listing.self) { listing in
					ListingDetailView(listing: listing)
				}
			}
		}
		.onAppear {
			Task {
				await viewModel.fetchListings()
			}
		}
	}
}

#Preview {
	ExploreView()
}

