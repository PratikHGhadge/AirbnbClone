//
//  LoginOrSignUpView.swift
//  AirbnbClone
//
//  Created by Pratik Haridas Ghadge on 28/09/25.
//

import SwiftUI

struct Country: Identifiable {
	let id = UUID()
	let name: String
	let code: String
	let dialCode: String
}

let countries: [Country] = [
	Country(name: "India", code: "IN", dialCode: "+91"),
	Country(name: "United States", code: "US", dialCode: "+1"),
	Country(name: "Canada", code: "CA", dialCode: "+1"),
	Country(name: "Mexico", code: "MX", dialCode: "+52"),
	Country(name: "Germany", code: "DE", dialCode: "+49"),
	Country(name: "France", code: "FR", dialCode: "+33"),
	Country(name: "Italy", code: "IT", dialCode: "+39")
]


struct LoginOrSignUpView: View {
	@State private var phoneNumber = ""
	@State private var selectedCountry: Country = countries[0]
	@State private var isShowingCountryPicker = false
	@Binding var dismiss: Bool

	var body: some View {
		VStack {
			HStack{
				Button{
					dismiss.toggle()
				}label: {
					Image(systemName: "xmark")
						.foregroundColor(.black)
						.padding(.leading)
				}
				HStack {
					Spacer()
					Text("Log in or Sign up")
						.frame(height: 60)
						.font(.title3)
						.fontWeight(.semibold)
						.padding(.trailing)
					Spacer()
				}
			}.padding(.horizontal)
			Divider()
			ScrollView{
				VStack{
					VStack (spacing: 18){
						HStack {
							Button {
								isShowingCountryPicker.toggle()
							} label: {
								VStack(alignment: .leading) {
									Text("Country/Region")
										.font(.footnote)
										.foregroundStyle(.gray)
									Text("\(selectedCountry.name) (\(selectedCountry.dialCode))")
										.foregroundColor(.black)
								}
								.padding()
								Spacer()
								Image(systemName: "chevron.down")
									.foregroundColor(.black)
									.padding()
							}
						}
						.frame(height: 60)
						.overlay(
							RoundedRectangle(cornerRadius: 8)
								.stroke(.gray, lineWidth: 1)
						)
						.sheet(isPresented: $isShowingCountryPicker) {
							CountryPickerView(selectedCountry: $selectedCountry)
						}

						TextField("Phone Number", text: $phoneNumber)
							.padding(.horizontal)
							.frame(height: 60)
							.overlay(
								RoundedRectangle(cornerRadius: 8)
									.stroke(.gray, lineWidth: 1 )
							)
					}
					.frame(height: 120)

					Text("We'll call or text to confirm your number. Stantard message and data rates apply")
						.padding(.vertical)
						.font(.footnote)
						.foregroundColor(.gray)


					Button {
						// TODO: Handel login with phone number
					} label: {
						HStack {
							Spacer()
							Text("Continue")
								.font(.title3)
								.foregroundStyle(.white)
								.font(.subheadline)
								.fontWeight(.bold)
							Spacer()
						}
						.frame(height: 60)
						.background(.pink)
						.clipShape(RoundedRectangle(cornerRadius: 8))
					}.padding(.top)

					HStack {
						VStack{
							Divider()
						}
						Text("or")
						VStack{
							Divider()
						}
					}.padding(.vertical)


					VStack (spacing: 20){
						Button {
							// TODO: Handel login with email
						} label: {
							LoginButtonView(title: "Continue with email", iconName: "envelope")
						}
						Button {
							// TODO: Handel login with apple
						} label: {
							LoginButtonView(title: "Continue with Apple", iconName: "apple.logo")
						}

						Button {
							// TODO: Handel login with google
						} label: {
							LoginButtonView(title: "Continue with Google", iconName: "google", isImage: true)
						}

						Button {
							// TODO: Handel login with facebook
						} label: {
							LoginButtonView(title: "Continue with Facebook", iconName: "facebook", isImage: true)
						}
					}
				}.padding()
			}
		}
	}
}

#Preview {
	LoginOrSignUpView(dismiss: .constant(false))
}

struct LoginButtonView: View {
	var title : String
	var iconName: String
	var isImage = false;
	var body: some View {
		HStack {
			if (isImage) {
				Image(iconName)
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.foregroundColor(.white)
					.padding(.leading, 30)
			}else{
				Image(systemName: iconName)
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.foregroundColor(.black)
					.padding(.leading, 30)
			}
			Spacer()
			Text(title)
				.font(.headline)
				.padding(.trailing, 20)
				.foregroundColor(.black)
			Spacer()

		} .foregroundStyle(.white)
			.font(.subheadline)
			.frame(height: 54)
			.overlay(
				RoundedRectangle(cornerRadius: 8)
					.stroke(.gray, lineWidth: 1)
			)
	}
}
