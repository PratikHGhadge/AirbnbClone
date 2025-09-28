//
//  WishlistView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import SwiftUI

struct WishlistView: View {
	@State var isLoginOrSignUp : Bool = false;

	var body: some View {
		NavigationStack {
			VStack(alignment: .leading, spacing: 32) {
				VStack(alignment: .leading, spacing: 4) {
					Text("Log in to view your wishlists")
						.font(.headline)

					Text("You can create, view or edit wishlists once you've logged in.")
						.font(.footnote)

				}

				Button {
					isLoginOrSignUp = true
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
				Spacer()
			}
			.padding()
			.navigationBarTitle("Wishlist")
		}
		.sheet(isPresented: $isLoginOrSignUp) {
			LoginOrSignUpView(dismiss: $isLoginOrSignUp)
		}

	}
}

#Preview {
	WishlistView()
}
