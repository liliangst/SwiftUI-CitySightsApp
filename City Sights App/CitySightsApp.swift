//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Lilian Grasset on 22/08/2021.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
