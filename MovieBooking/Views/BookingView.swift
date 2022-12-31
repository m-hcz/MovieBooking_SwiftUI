//
//  BookingView.swift
//  MovieBooking
//
//  Created by M H on 30/12/2022.
//

import SwiftUI

struct BookingView: View {
	@Environment(\.dismiss) var dismiss
	@State var gradient = [Color.bgColor2.opacity(0),Color.bgColor2,Color.bgColor2,Color.bgColor2]
	@State var selectedDate = false
	@State var selectedHour = false
	@State var bindingSelection = false
	
	var body: some View {
		NavigationView {
			ZStack {
				Image("booking")
					.resizable()
					.scaledToFit()
					.frame(maxHeight: .infinity, alignment: .top)
				
				VStack {
					LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
						.frame(height: 600)
				}
				.frame(maxHeight: .infinity, alignment: .bottom)
				
				VStack(spacing: 0.0) {
					HStack {
						CircleButton(action: {
							dismiss()
						}, image: "arrow.left")
						
						Spacer()
						
						CircleButton(action: {
							
						}, image: "ellipsis")
					}
					.padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
					
					Text("Doctor strange")
						.font(.title3)
						.bold()
						.padding(.top, 200)
					Text("in the Multiverse of Mandes")
						.font(.title3)
					Text("subtitle")
						.font(.subheadline)
						.padding(30)
					Text("Select date and time")
						.fontWeight(.semibold)
					
					HStack(alignment: .top, spacing: 20) {
						DateButton(weekDay: "Thu", numDay: "21", isSelected: $bindingSelection)
							.padding(.top, 90)
						DateButton(weekDay: "Fri", numDay: "22", isSelected: $bindingSelection)
							.padding(.top, 70)
						DateButton(weekDay: "Sat", numDay: "23", width: 70, height: 100, isSelected: $selectedDate) {
							withAnimation(.spring()) {
								selectedDate.toggle()
							}
						}
						.padding(.top, 30)
						DateButton(weekDay: "Sun", numDay: "24", isSelected: $bindingSelection)
							.padding(.top, 70)
						DateButton(weekDay: "Mon", numDay: "25", isSelected: $bindingSelection)
							.padding(.top, 90)
					}
					
					HStack(alignment: .top, spacing: 20.0) {
						TimeButton(hour: "16:00", isSelected: $bindingSelection)
							.padding(.top, 20)
						TimeButton(hour: "17:00", isSelected: $bindingSelection)
						TimeButton(hour: "18:00", width: 70, height: 40, isSelected: $selectedHour) {
							withAnimation(.spring()) {
								selectedHour.toggle()
							}
						}
						.padding(.top, -20)
						TimeButton(hour: "19:00", isSelected: $bindingSelection)
						TimeButton(hour: "20:00", isSelected: $bindingSelection)
							.padding(.top, 20)
					}
					
					NavigationLink {
						SeatsView()
					} label: {
						Text("Reservation")
							.bold()
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(
									RoundedRectangle(cornerRadius: 15)
										.fill(.red)
							)
							.padding(20)
							.offset(y: selectedDate && selectedHour ? 0 : 200)
					}

				}
				
				.foregroundColor(.white)
				.frame(maxHeight: .infinity, alignment: .top)
			}
			.background(Color.bgColor2)
			.ignoresSafeArea()
		}
		.navigationBarBackButtonHidden(true)
	}
}

struct BookingView_Previews: PreviewProvider {
	static var previews: some View {
		BookingView()
	}
}
