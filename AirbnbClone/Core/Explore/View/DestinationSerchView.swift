//
//  DestinationSerchView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

enum DestinationSearchOptions {
	case location
	case dates
	case guests
}

struct DestinationSearchView: View {

	@Binding var show: Bool
	@State private var destination: String = ""
	@State private var selectedOption: DestinationSearchOptions = .location
	@State private var startDate: Date = Date()
	@State private var endDate: Date = Date()
	@State private var guests: Int = 0
	@ObservedObject var exploreViewModel: ExploreViewModel

	var body: some View {
		VStack {
			HStack {
				Button {
					withAnimation(.snappy) {
						show.toggle()
					}
				} label: {
					Image(systemName: "xmark.circle")
						.imageScale(.large)
						.foregroundStyle(.black)

				}

				Spacer()

				if !destination.isEmpty {
					Button("Clear") {
						destination = ""
					}
					.foregroundStyle(.black)
					.font(.subheadline)
					.fontWeight(.semibold)
				}
			}
			.padding()

			VStack(alignment: .leading) {

				if selectedOption == .location {
					Text("Where to go?")
						.font(.title2)
						.fontWeight(.semibold)

					HStack {
						Image(systemName: "magnifyingglass")
							.imageScale(.small)

						TextField("Serch destinations", text:$destination)
							.font(.subheadline)
							.onSubmit {
								exploreViewModel.updateListingsForLocation(destination)
							}
					}
					.frame(height: 44)
					.padding(.horizontal)
					.overlay {
						RoundedRectangle(cornerRadius: 8)
							.stroke(lineWidth:1.0)
							.foregroundStyle(Color(.systemGray4))
					}
				} else {
					CollapsedPickerView(title: "Where", description: "Add destination")
				}


			}
			.modifier(CollapsibleDestinationViewModifier())
			.frame(height: selectedOption == .location ? 120 : 64)
			.onTapGesture {
				withAnimation(.snappy) {
					selectedOption = .location
				}
			}

			// date selection view
			VStack(alignment: .leading) {
				if selectedOption == .dates {
					Text("When's your trip?")
						.font(.title2)
						.fontWeight(.semibold)

					VStack {
						DatePicker(
							"From",
							selection: $startDate,
							displayedComponents: .date
						)
						Divider()
						DatePicker(
							"To",
							selection: $endDate,
							displayedComponents: .date
						)
					}
					.foregroundStyle(.gray)
					.font(.subheadline)
					.fontWeight(.semibold)

				} else {
					CollapsedPickerView(title: "When", description: "Add dates")
				}
			}
			.modifier(CollapsibleDestinationViewModifier())
			.frame(height: selectedOption == .dates ? 180 : 64)
			.onTapGesture {
				withAnimation(.snappy) {
					selectedOption = .dates
				}
			}

			// num guests view
			VStack(alignment: .leading) {

				if selectedOption == .guests {
					Text("Who's coming?")
						.font(.title)
						.fontWeight(.semibold)
					HStack {
						Text("\(guests)")

						Stepper("Adults", value: $guests, in: 1...50)
					}

				} else {
					CollapsedPickerView(title: "Who", description: "Guests")
				}
			}
			.modifier(CollapsibleDestinationViewModifier())
			.frame(height: selectedOption == .guests ? 120 : 64)
			.onTapGesture {
				withAnimation(.snappy) {
					selectedOption = .guests
				}
			}
			Spacer()
		}
		.padding()
		.overlay(alignment: .bottom){
			HStack {
				Button {
					destination = "";
					guests = 0;
					startDate = Date();
					endDate = Date();
					exploreViewModel.updateListingsForLocation(destination)

				}label: {
					Text("Clear all")
						.foregroundStyle(.black)
						.underline()
				}
				Spacer()
				Button {
					exploreViewModel.updateListingsForLocation(destination)
					show.toggle()
				} label: {
					HStack {
						Image(systemName: "magnifyingglass")
							.resizable()
							.scaledToFit()
							.frame(width: 15, height: 15)
							.foregroundColor(.white)

						Text("Search")
							.font(.subheadline)
							.fontWeight(.semibold)

					} .foregroundStyle(.white)
						.font(.subheadline)
						.frame(width: 140, height: 50)
						.background(.pink)
						.clipShape(RoundedRectangle(cornerRadius: 8))
				}
			}
			.padding(.top)
			.padding(.horizontal)
			.frame(height: 70)
			.background(.white)
		}
		.toolbar(.hidden, for: .tabBar)
		.background(Color(.systemGray5))
	}
}

#Preview {
	DestinationSearchView(
		show: .constant(true),
		exploreViewModel: ExploreViewModel(service: ExploreService())
	)
}

struct CollapsibleDestinationViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding()
			.background(.white)
			.clipShape(RoundedRectangle(cornerRadius: 12))
			.padding()
			.shadow(radius: 10)
	}
}
struct CollapsedPickerView: View {
	let title: String
	let description: String

	var body: some View {
		VStack {
			HStack {
				Text(title)
					.foregroundStyle(.gray)

				Spacer()

				Text(description)
			}
			.font(.subheadline)
			.fontWeight(.semibold)
		}

	}
}
