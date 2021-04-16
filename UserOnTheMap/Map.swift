//
//  Map.swift
//  FindUserOnTheMap
//
//  Created by Abdullah Alnutayfi on 16/04/2021.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    let annotation = MKPointAnnotation()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        annotation.coordinate = coordinate
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(annotation)
            
    }
}

