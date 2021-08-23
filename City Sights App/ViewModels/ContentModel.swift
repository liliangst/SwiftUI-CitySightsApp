//
//  ContentModel.swift
//  City Sights App
//
//  Created by Lilian Grasset on 23/08/2021.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        // Set the content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission
            
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
           
            // We don't have permission
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        print(locations.first ?? "no location")
        
        // Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
        
        // TODO: If we have the coordonates of the user, send into Yelp API

    }
}
