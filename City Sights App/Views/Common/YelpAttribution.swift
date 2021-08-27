//
//  YelpAttribution.swift
//  City Sights App
//
//  Created by Lilian Grasset on 27/08/2021.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
       
        Link(destination: URL(string: link)!, label: {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        })
        
    }
}

struct YelpAttribution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttribution(link: "https://www.yelp.fr")
    }
}
