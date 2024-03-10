//
//  StartTab.swift
//  Maps
//
//  Created by Juan Hernandez Pazos on 10/03/24.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView {
            Group {
                TripMapView()
                    .tabItem {
                        Label("TripMap", systemImage: "map")
                    }
                
                DestinationLocationsMapView()
                    .tabItem {
                        Label("Destinations", systemImage: "globe.desk")
                    }
            } // Group
            .toolbarBackground(.appBlue.opacity(0.8), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        } // TabView
    }
}

#Preview {
    StartTab()
}
