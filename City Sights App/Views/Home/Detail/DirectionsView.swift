//
//  DirectionsView.swift
//  City Sights App
//
//  Created by Lilian Grasset on 26/08/2021.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {

        VStack (alignment: .leading) {
            
            // Business title
            HStack {
                
                BusinessTitle(business: business)
                    .padding()
                
                Spacer()
                
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name {
                
                    Link("Open in Maps", destination: URL(string: "https://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                }
            }
            // Directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
