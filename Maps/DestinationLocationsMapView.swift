//
//  DestinationLocationsMapView.swift
//  Maps
//
//  Created by Juan Hernandez Pazos on 10/03/24.
//

import SwiftUI
import MapKit

/*
 Doble clic para zoom
 Shift + Clic + Desp arriba Zoom In
 Shift + Clic + Desp abajo Zoom Out
 Option = dos dedos
 Option `Arrastrar para girar
 Option + Shift + Drag cambia orientación
 */

struct DestinationLocationsMapView: View {
    // MARK: Properties
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    
    // MARK: View
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Angel de la Independencia", coordinate: .angelIndendencia)
            
            Marker(coordinate: .bellasArtes) {
                Label("Bellas Artes", systemImage: "star.fill")
            }
            .tint(.yellow)
            
            Marker("Monumento a la Madre", systemImage: "person.crop.artframe", coordinate: .monumentoMadre)
                .tint(.appBlue)
            
            Marker("Plaza de la Constitución", monogram: Text("PC"), coordinate: .plazaConstitucion)
                .tint(.accent)
            
            Annotation("Estela de la Luz", coordinate: .estelaLuz) {
                Image(systemName: "star")
                    .imageScale(.medium)
                    .foregroundStyle(.red)
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
            }
            
            Annotation("Monumento Revolución", coordinate: .monumentoRevolucion, anchor: .center) {
                Image(.monumentoconstitucion)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Annotation("Museo Arte Moderno", coordinate: .museoArteModerno) {
                Image(systemName: "mappin")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .padding(6)
                    .overlay {
                        Circle()
                            .strokeBorder(.red, lineWidth: 2)
                    }
            }
            
            MapCircle(
                center: CLLocationCoordinate2D(latitude: 19.430105, longitude: -99.133607),
                radius: 5500
            )
            .foregroundStyle(.red.opacity(0.5))
        } // Map
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
        }
        .onAppear {
            // 19.430105, -99.133607
            let cdmx = CLLocationCoordinate2D(latitude: 19.430105, longitude: -99.133607)
            let cdmxSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            let cdmxRegion = MKCoordinateRegion(center: cdmx, span: cdmxSpan)
            
            cameraPosition = .region(cdmxRegion)
        } // OnAppear
    }
}

// MARK: Preview
#Preview {
    DestinationLocationsMapView()
}
