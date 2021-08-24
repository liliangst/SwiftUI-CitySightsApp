//
//  HomeView.swift
//  City Sights App
//
//  Created by Lilian Grasset on 24/08/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Determine if we should show list or map
            if !isMapShowing {
                // Show list
                VStack (alignment: .leading){
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Landos")
                        Spacer()
                        Text("Switch to Map view")
                    }
                    Divider()
                    
                    BusinessList()
                }
                .padding([.horizontal,.top])
            }
            else {
                // Show map
               
            }
        }
        else {
            // Still waiting for data so show spinner
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
