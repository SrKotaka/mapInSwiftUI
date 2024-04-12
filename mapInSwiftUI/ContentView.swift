//
//  ContentView.swift
//  mapInSwiftUI
//
//  Created by FELIPE LUVIZOTTO DE CASTRO on 12/04/24.
//

import SwiftUI
import MapKit

struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Identifiable{
    public var id: String{
        "\(latitude)-\(longitude)"
    }
}

struct City: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    
    @State private var region =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.507222, longitude: -0.1275),
    span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    let annotations = [
        City(name: "Londres", coordinate:CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        City(name: "Cotuca", coordinate: CLLocationCoordinate2D(latitude: -22.902196544008618, longitude: -47.0669715182478)),
        City(name: "Brasilia", coordinate:CLLocationCoordinate2D(latitude: -15.7797, longitude: -47.9297)),
        City(name: "China", coordinate:CLLocationCoordinate2D(latitude: 39.9042, longitude: 116.4074)),
        City(name: "Rússia", coordinate:CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173)),
        City(name: "Alemanha", coordinate:CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050)),
        City(name: "Reino Unido", coordinate:CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)),
        City(name: "Estados Unidos", coordinate:CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369)),
        City(name: "França", coordinate:CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522))
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotations){
                MapAnnotation(coordinate: $0.coordinate){
                    Circle()
                        .strokeBorder(.red, lineWidth: 4)
                        .frame(width: 40,height: 40)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
