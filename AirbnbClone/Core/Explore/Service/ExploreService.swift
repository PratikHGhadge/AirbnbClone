//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import Foundation

class ExploreService {
	func fetchListings() async throws -> [Listing] {
		return DeveloperPreview.shared.listings
	}
}
