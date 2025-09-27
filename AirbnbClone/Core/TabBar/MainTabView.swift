//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import SwiftUI

struct MainTabView: View {
	var body: some View {
		TabView {
			ExploreVirew()
				.tabItem {
					Label("Explore", systemImage: "magnifyingglass")
				}

			WishlistView()
				.tabItem {
					Label("Wishlist", systemImage: "heart")
				}
			
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person")
				}
		}
	}
}


#Preview {
	MainTabView()
}
