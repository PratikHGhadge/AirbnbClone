//
//  Listing.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import Foundation

struct Listing: Identifiable, Codable {
	let id: String
	let ownerUserID: String
	let ownerName: String
	let ownerImageURL: String
	let numberOfBedrooms: Int
	let numberOfBathrooms: Int
	let numberOfGuests: Int
	let numberOFBeds: Int
	var pricePerNight: Int
	let latitude: Double
	let longitude: Double
	var imageURLs: [String]
	let address: String
	let city: String
	let state: String
	let title: String
	var rating: Double
	var features: [ListingFeatures]
	var amenities: [ListingAmenities]
	let type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
	case selfCheckin
	case suprHost

	var imageName: String {
		switch self {
			case .selfCheckin:
				return "door.left.hand.open"
			case .suprHost:
				return "medal"
		}
	}

	var title: String {
		switch self {
			case .selfCheckin:
				return "Self Check-In"
			case .suprHost:
				return "Superhost"
		}
	}

	var subTitle: String {
		switch self {
			case .selfCheckin:
				return "Check yourself in with the keypad."
			case .suprHost:
				return "Superhosts are experienced, highly rated hosts who are committed to providing great stars for guests."
		}
	}

	var id: Int { return self.rawValue }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
	case kitchen
	case laundry
	case wifi
	case tv
	case office
	case pool
	case balcony

	var title: String {
		switch self {
			case .kitchen:
				return "Kitchen"
			case .laundry:
				return "Laundry"
			case .wifi:
				return "Wifi"
			case .tv:
				return "TV"
			case .office:
				return "Office"
			case .pool:
				return "Pool"
			case .balcony:
				return "Balcony"
		}
	}

	var imageName: String {
		switch self {
			case .kitchen:
				return "fork.knife"
			case .laundry:
				return "washer"
			case .wifi:
				return "wifi"
			case .tv:
				return "tv"
			case .office:
				return "pencil.and.ruler.fill"
			case .pool:
				return "figure.pool.swim"
			case .balcony:
				return "building"
		}
	}

	var id: Int { return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
	case apartment
	case house
	case townhouse
	case villa

	var description: String {
		switch self {
			case .apartment:
				return "Apartment"
			case .house:
				return "House"
			case .townhouse:
				return "Townhouse"
			case .villa:
				return "Villa"
		}
	}

	var id: Int { return self.rawValue }
}
