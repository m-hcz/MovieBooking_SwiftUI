//
//  ScrollSection.swift
//  MovieBooking
//
//  Created by M H on 30/12/2022.
//

import SwiftUI

struct ScrollSection: View {
	
	var title: String
	@State var posters: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.font(.headline)
				.foregroundColor(.white)
				.padding(.horizontal, 20)
			
			ScrollView(.horizontal, showsIndicators:  false) {
				HStack(spacing: 20) {
					ForEach(posters.indices, id: \.self) { index in
						NavigationLink {
							BookingView()
						} label: {
							Image(posters[index])
								.resizable()
								.frame(width: 100, height: 130)
								.cornerRadius(20)
						}
					}
				}
				.padding(.horizontal, 20)
			}
		}
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
		ScrollSection(title: "Now playing")
    }
}
