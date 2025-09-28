//
//  CountryPickerView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import SwiftUI

struct CountryPickerView: View {
	@Binding var selectedCountry: Country
	@Environment(\.dismiss) var dismiss

	var body: some View {
		NavigationView {
			List(countries) { country in
				Button {
					selectedCountry = country
					dismiss()
				} label: {
					HStack {
						Text(country.name)
						Spacer()
						Text(country.dialCode)
							.foregroundColor(.gray)
					}
				}
			}
			.navigationTitle("Select Country")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}
