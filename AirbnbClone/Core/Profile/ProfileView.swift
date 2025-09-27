//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import SwiftUI

struct ProfileView: View {
	var body: some View {
		VStack {
			// Profile login view
			VStack(alignment: .leading, spacing: 32) {
				VStack(alignment: .leading, spacing: 8) {
					Text("Profile")
						.font(.largeTitle)
						.fontWeight(.semibold)

					Text("Log in to start planning your next trip")
				}

				Button {
					print("Log in")
				} label: {
					Text("Log in")
						.font(.subheadline)
						.fontWeight(.semibold)
						.frame(width: 340)
						.foregroundColor(.white)
						.padding()
						.background(.pink)
						.cornerRadius(8)
				}

				HStack {
					Text("Don't have an account?")
					Text("Sign up")
						.fontWeight(.semibold)
						.foregroundColor(.pink)
						.underline()
				}

			}

			// Profile options
			VStack(spacing: 24) {
				ProfileOptionRowView(imageName: "gear", title: "Settings")
				ProfileOptionRowView(imageName: "gear", title: "Accessibility")
				ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
			}
			.padding(.vertical)
		}
		.padding()
	}
}

#Preview {
	ProfileView()
}
