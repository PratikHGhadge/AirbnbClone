//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var listings = [Listing]()
	private let service: ExploreService

	init(service: ExploreService) {
		self.service = service
	}

	func fetchListings() async {
		do {
			self.listings = try await service.fetchListings()
		} catch {
			print(
				"Debug: Failed to fetching listings with error: \(error.localizedDescription)"
			)
		}
	}

	func updateListingsForLocation(_ location: String) {
		let filteredListings = listings.filter {
			$0.city.lowercased() == location.lowercased() ||
			$0.state.lowercased() == location.lowercased()
		}
		self.listings = filteredListings.isEmpty ? listings : filteredListings
	}
}
