//
//  SeatsView.swift
//  MovieBooking
//
//  Created by M H on 31/12/2022.
//

import SwiftUI

struct SeatsView: View {
	
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		VStack(spacing: 0) {
			HStack {
				CircleButton(action: {
					dismiss()
				}, image: "arrow.left")
				
				Spacer()
				
				Text("Choose Seats")
					.font(.title3)
					.foregroundColor(.white)
					.fontWeight(.bold)
				
				Spacer()
				
				CircleButton(action: {
					
				}, image: "calendar")
			}
			.padding(.top, 46)
			.padding(.horizontal, 20)
			
			Image("frontSeat")
				.padding(.top, 55)
				.glow(color: Color("pink"), radius: 20)
			
			Image("seats")
				.frame(height: 240)
				.padding(.top, 60)
				.padding(.horizontal, 20)
			
			HStack(spacing: 20.0) {
				StatusUI()
				StatusUI(color: Color("majenta"), text: "Reserved")
				StatusUI(color: Color("cyan"), text: "Selected")
			}
			.padding(.top, 60)
			
			Spacer()
			
			ZStack(alignment: .topLeading) {
				VStack(alignment: .leading, spacing: 30) {
					HStack(spacing: 10) {
						Image(systemName: "calendar")
							Text("april 28, 2022")
						Circle()
							.frame(width: 6, height: 6)
						Text("6 p.m.")
					}
					HStack(spacing: 10) {
						Image(systemName: "ticket.fill")
						Text("VIP Section")
						Circle()
							.frame(width: 6, height: 6)
						Text("Seat 9, 10")
					}
					HStack(spacing: 10) {
						Image(systemName: "cart.fill")
						Text("Total: $30")
					}
				}
				.padding(40)
				.font(.subheadline)
				
				HStack {
					Spacer()
					
					RoundButton() {
						NavigationUtil.popToRootView()
					}
				}
				.padding(.top, 50)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
			.clipped()
			.foregroundColor(.white)
			.background(.ultraThinMaterial)
			.padding(.top, 50)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.background(Color.bgColor)
		.ignoresSafeArea()
		.navigationBarBackButtonHidden(true)
    }
}

struct SeatsView_Previews: PreviewProvider {
    static var previews: some View {
        SeatsView()
    }
}
