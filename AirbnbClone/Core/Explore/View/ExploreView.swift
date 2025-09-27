//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//


import SwiftUI

struct ExploreVirew: View {

	@State private var showDestinationSerchView = true

	var body: some View {
		NavigationStack {
			if showDestinationSerchView {
				DestinationSerchView(show: $showDestinationSerchView)
			} else {
				ScrollView {
					SearchAndFilterBar()
						.onTapGesture {
							withAnimation(.snappy) {
								showDestinationSerchView.toggle()
							}
						}

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
}

#Preview {
	ExploreVirew()
}

