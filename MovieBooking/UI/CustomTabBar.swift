//
//  CustomTabBar.swift
//  MovieBooking
//
//  Created by M H on 30/12/2022.
//

import SwiftUI

struct CustomTabBar: View {
	
	@Binding var currentTab: Tab
	var bgColors = [Color.purple, Color.lightBlue, Color.pink]
	var gradColors = [Color.cyan, Color.cyan.opacity(0.1), Color.cyan]
	
    var body: some View {
		GeometryReader { geo in
			let width = geo.size.width
			
			VStack {
				HStack(spacing: 0) {
					ForEach(Tab.allCases, id: \.rawValue) { tab in
						Button {
							withAnimation(.easeInOut) {
								currentTab = tab
							}
						} label: {
							Image(tab.rawValue)
								.renderingMode(.template)
								.frame(maxWidth: .infinity)
								.foregroundColor(.white)
								.offset(y: currentTab == tab ? -17 : 0)
						}
					}
				}
				.frame(maxWidth: .infinity)
				.background(alignment: .leading) {
					Circle()
						.fill(.ultraThinMaterial)
						.frame(minWidth: 70, minHeight: 70)
						.shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 10)
						.offset(x: indicatorOffset(width: width) + 4, y: -15)
						.overlay {
							Circle()
								.trim(from: 0, to: CGFloat(0.5))
								.stroke(
									LinearGradient(colors: gradColors, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2)
								)
								.rotationEffect(.degrees(135))
								.frame(width: 68, height: 68)
								.offset(x: indicatorOffset(width: width) + 4, y: -15)
						}
			}
			}
		}
		.frame(height: 24)
		.padding(.top, 30)
		.background(.ultraThinMaterial)
		.background(
			LinearGradient(colors: bgColors, startPoint: .leading, endPoint: .trailing)
		)
    }
	
	func indicatorOffset(width: CGFloat) -> CGFloat {
		let index = CGFloat(getIndex())
		if index == 0 { return 0 }
		
		let buttonwidth = width / CGFloat(Tab.allCases.count)
		
		return index * buttonwidth
	}
	
	func getIndex() -> Int {
		switch currentTab {
			case .home:
				return 0
			case .location:
				return 1
			case .ticket:
				return 2
			case .category:
				return 3
			case .profile:
				return 4
		}
	}
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
