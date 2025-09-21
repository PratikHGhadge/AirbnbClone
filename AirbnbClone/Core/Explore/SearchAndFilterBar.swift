//
//  SearchAndFilterBar.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 21/09/25.
//

import SwiftUI

struct SearchAndFilterBar: View {
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")

			VStack(alignment: .leading, spacing: 2) {
				Text("Where to?")
					.font(.footnote)
					.fontWeight(.semibold)

				Text("Anywhere - Any Week - Add guests")
					.font(.caption2)
					.foregroundStyle(.gray)
			}

			Spacer()

			Button(action: {
			}, label: {
				Image(systemName: "line.3.horizontal.decrease.circle")
					.foregroundColor(.black)
			})

		}
		.padding(.horizontal)
		.padding(.vertical, 10)
		.overlay {
			Capsule()
				.stroke(Color.gray, lineWidth: 0.5)
				.shadow(color: .black.opacity(0.4), radius: 3)
		}
		.padding()
	}
}

#Preview {
	SearchAndFilterBar()
}

