//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {

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

	@Environment(\.dismiss) var dismiss

	var body : some View {
		ScrollView {
			ZStack(alignment: .topLeading) {
				ListingImageCarouselView()
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
				Text("Midetown Suite")
					.font(.title)
					.fontWeight(.semibold)

				VStack(alignment: .leading) {
					HStack(spacing: 2) {
						Image(systemName: "star.fill")

						Text("4.7")

						Text(" - ")
						Text("28 reviews")
							.underline()
							.fontWeight(.semibold)
					}
					.foregroundColor(.black)

					Text("Midtown suite, benglore")
				}
				.font(.caption)
			}
			.padding(.leading)
			.frame(maxWidth: .infinity, alignment: .leading)

			Divider()

			// Host info view
			HStack() {
				VStack(alignment: .leading, spacing: 4) {
					Text("Entire villa is hosted by Pratik Ghadge")
						.font(.headline)
						.frame(width: 250, alignment: .leading)

					HStack(spacing: 2) {
						Text("4 guests ·")
						Text("2 bedrooms ·")
						Text("2 bathrooms")
					}
				}
				.frame(width: 300)

				Spacer()

				Image(systemName: "person.circle.fill")
					.resizable()
					.scaledToFill()
					.frame(width: 64, height: 64)
					.clipShape(Circle())
			}
			.padding()

			Divider()

			//  Listing features
			VStack(alignment: .leading, spacing: 16) {
				ForEach(0 ..< 2) { feature in
					HStack(spacing: 12) {

						Image(systemName: "medal")

						VStack(alignment: .leading) {
							Text("Superhost")
								.font(.footnote)
								.fontWeight(.semibold)

							Text("Superhosts are experienced hosts who commited to providing a clean, safespace.")
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
						ForEach(1 ... 5, id: \.self) { bedroom in
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
				
				ForEach(0 ..< 5) { amenity in
					HStack {
						Image(systemName: "wifi")
							.frame(width: 32)

						Text("Wifi")
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
		.ignoresSafeArea()
		.padding(.bottom, 64)
		.overlay(alignment: .bottom) {
			VStack {
				Divider()
					.padding(.bottom)
				HStack {
					VStack(alignment: .leading) {
						Text("$500")
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
	ListingDetailView()
}
