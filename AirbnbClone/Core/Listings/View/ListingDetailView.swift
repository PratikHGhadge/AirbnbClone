//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {

	let listing : Listing

	@Environment(\.dismiss) var dismiss

	var body : some View {
		ScrollView {
			ZStack(alignment: .topLeading) {
				ListingImageCarouselView(images: listing.imageURLs)
					.frame(height: 320)

				Button {
					dismiss()
				} label: {
					Image(systemName: "chevron.left")
						.foregroundStyle(.black)
						.background {
							Circle()
								.fill(.white)
								.frame(width: 32, height: 32)
						}
						.padding(32)
				}
			}

			VStack(alignment: .leading, spacing: 8) {
				Text("\(listing.title)")
					.font(.title)
					.fontWeight(.semibold)

				VStack(alignment: .leading) {
					HStack(spacing: 2) {
						Image(systemName: "star.fill")

						Text("\(listing.rating.formatted())")

						Text(" - ")
						Text("28 reviews")
							.underline()
							.fontWeight(.semibold)
					}
					.foregroundColor(.black)

					Text("\(listing.city), \(listing.state)")
				}
				.font(.caption)
			}
			.padding(.leading)
			.frame(maxWidth: .infinity, alignment: .leading)

			Divider()

			// Host info view
			HStack() {
				VStack(alignment: .leading, spacing: 4) {
					Text(
						"Entire \(listing.type) is hosted by \(listing.ownerName)"
					)
						.font(.headline)
						.frame(width: 250, alignment: .leading)

					HStack(spacing: 2) {
						Text("\(listing.numberOfGuests) guests ·")
						Text("\(listing.numberOFBeds) bedrooms ·")
						Text("\(listing.numberOfBathrooms) bathrooms")
					}
				}
				.frame(width: 300)

				Spacer()

				Image(systemName: listing.ownerImageURL)
					.resizable()
					.scaledToFill()
					.frame(width: 64, height: 64)
					.clipShape(Circle())
			}
			.padding()

			Divider()

			//  Listing features
			VStack(alignment: .leading, spacing: 16) {
				ForEach(listing.features) { feature in
					HStack(spacing: 12) {

						Image(systemName: feature.imageName)

						VStack(alignment: .leading) {
							Text(feature.title)
								.font(.footnote)
								.fontWeight(.semibold)

							Text(feature.subtitle)
								.font(.caption)
								.foregroundStyle(.gray)
						}
						Spacer()
					}
				}
			}
			.padding()

			Divider()

			// Bedrooms view
			VStack(alignment: .leading, spacing: 16) {
				Text("Where you'll sleep")
					.font(.headline)

				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 16) {
						ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
							VStack(alignment: .leading) {
								Image(systemName: "bed.double")

								Text("Bedroom \(bedroom)")
							}
							.frame(width: 132, height: 100)
							.overlay {
								RoundedRectangle(cornerRadius: 12)
									.stroke(lineWidth: 1)
									.foregroundStyle(.gray)
							}
						}
					}
				}
				.scrollTargetBehavior(.paging)
			}
			.padding()

			Divider()

			// Listing amanities
			VStack(alignment: .leading, spacing: 16) {
				Text("Whats this place offers")
					.font(.headline)
				
				ForEach(listing.amenities) { amenity in
					HStack {
						Image(systemName: amenity.imageName)
							.frame(width: 32)

						Text(amenity.title)
							.font(.footnote)

						Spacer()
					}
				}
			}
			.padding()

			Divider()

			VStack(alignment: .leading, spacing: 16) {
				Text("Where you'll be")
					.font(.headline)

				Map()
					.frame(height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 12))
			}
			.padding()
		}
		.toolbar(.hidden, for: .tabBar)
		.ignoresSafeArea()
		.padding(.bottom, 64)
		.overlay(alignment: .bottom) {
			VStack {
				Divider()
					.padding(.bottom)
				HStack {
					VStack(alignment: .leading) {
						Text("$\(listing.pricePerNight)")
							.font(.subheadline)
							.fontWeight(.semibold)

						Text("Total before taxes")
							.font(.footnote)
							.foregroundStyle(.gray)

						Text("Oct 15 - 20")
							.font(.footnote)
							.fontWeight(.semibold)
							.underline()
					}

					Spacer()

					Button {

					} label: {
						Text("Reserve")
							.foregroundStyle(.white)
							.font(.subheadline)
							.fontWeight(.semibold)
							.frame(width: 140, height: 40)
							.background(.pink)
							.clipShape(RoundedRectangle(cornerRadius: 8))
					}
				}
				.padding(.horizontal, 32)
			}
			.background(.white)
		}
	}
}

#Preview {
	ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
