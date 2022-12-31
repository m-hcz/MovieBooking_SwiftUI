//
//  ContentView.swift
//  MovieBooking
//
//  Created by M H on 29/12/2022.
//

import SwiftUI

struct ContentView: View {
	
	@State var currentTab: Tab = .home
	
	init() {
		UITabBar.appearance().isHidden = true
	}
	
    var body: some View {
		NavigationView {
			VStack(spacing: 0.0) {
				TabView(selection: $currentTab) {
					HomeView()
						.tag(Tab.home)
					Text(Tab.location.rawValue)
						.tag(Tab.location)
					TicketView()
						.tag(Tab.ticket)
					Text(Tab.category.rawValue)
						.tag(Tab.category)
					Text(Tab.profile.rawValue)
						.tag(Tab.profile)
				}
				
				CustomTabBar(currentTab: $currentTab)
			}
			.ignoresSafeArea(.keyboard)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
