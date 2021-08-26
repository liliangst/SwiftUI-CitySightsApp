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
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                
                // Determine if we should show list or map
                if !isMapShowing {
                    // Show list
                    VStack (alignment: .leading){
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                            Text("Landos")
                            Spacer()
                            Button("Switch to Map view") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            
                            // Create a business detail view instance
                            // Pass in the selected business
                            BusinessDetail(business: business)
                        }
                }
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
