//
//  Ticket.swift
//  MovieBooking
//
//  Created by M H on 30/12/2022.
//

import SwiftUI

struct Ticket: View {
	
	@State var title = "Thor"
	@State var subtitle = "Love and Tunder"
	@State var top = "thor-top"
	@State var bottom = "thor-bottom"
	@Binding var height: CGFloat
	
    var body: some View {
		VStack(spacing: 0.0) {
			VStack(spacing: 4) {
				Text(title)
					.bold()
				
				Text(subtitle)
			}
			.padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
			.frame(width: 250, height: 325, alignment: .top)
			.foregroundColor(.white)
			.background(
				Image(top)
					.resizable()
					.scaledToFill()
			)
			.mask {
				Image(top)
					.resizable()
					.scaledToFill()
			}
			
			Spacer(minLength: height)
			
			VStack(spacing: 10) {
				Line()
					.stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
					.frame(width: 200, height: 1)
					.opacity(0.6)
				
				HStack(spacing: 20) {
					HStack(spacing: 4) {
						Text("Date:")
							.fontWeight(.medium)
							.foregroundColor(Color.lightPurple)
						Text("April 23")
					}
					HStack(spacing: 4) {
						Text("Time:")
							.fontWeight(.medium)
							.foregroundColor(Color.lightPurple)
						Text("6 p.m.")
					}
				}
				.foregroundColor(.white)
				
				HStack(spacing: 20) {
					HStack(spacing: 4) {
						Text("Roe:")
							.fontWeight(.medium)
							.foregroundColor(Color.lightPurple)
						Text("1")
					}
					HStack(spacing: 4) {
						Text("Seats:")
							.fontWeight(.medium)
							.foregroundColor(Color.lightPurple)
						Text("9, 10")
					}
				}
				.foregroundColor(.white)
				
				Image("code")
			}
			.frame(width: 250, height: 135, alignment: .top)
			.background(
				.ultraThinMaterial
			)
			.background(
				Image(bottom)
					.resizable()
					.scaledToFill()
			)
			.mask(
				Image(bottom)
					.resizable()
					.scaledToFill()
			)
		}
		.frame(height: 460)
		.font(.footnote)
		.shadow(radius: 10)
    }
}

struct Ticket_Previews: PreviewProvider {
    static var previews: some View {
		Ticket(height: .constant(0))
    }
}
