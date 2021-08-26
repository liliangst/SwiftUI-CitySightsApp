//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Lilian Grasset on 26/08/2021.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack {
            // Business name
            Text(business.name!)
                .font(.largeTitle)
            
            // Loop through display address
            if business.location?.displayAddress != nil {
                ForEach (business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

