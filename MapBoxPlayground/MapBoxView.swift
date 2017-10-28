//
//  MapBoxView.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 25.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import Foundation
import Mapbox
import UIKit

class MapBoxView : NSObject, MapView, MGLMapViewDelegate {
    
    private var mapView: MGLMapView!
    var annotations = [MGLAnnotation]()
    var imageInfo = [String: String]()
    
    func update(withMapType mapType: MapType, entries: [MapEntry]) {
        maybeUpdate(mapType: mapType)
        update(entries: entries)
    }
    
    func maybeUpdate(mapType: MapType) {
        if mapView.styleURL != mapType.url {
            mapView.styleURL = mapType.url
        }
    }
    
    func update(entries: [MapEntry]) {
        mapView.removeAnnotations(annotations)
        imageInfo = [String: String]()
        annotations = [MGLAnnotation]()
        for entry in entries {
            let annotation = MGLPointAnnotation()
            annotation.coordinate = entry.location
            annotation.title = entry.title
            imageInfo[entry.title] = entry.entryType.imageName
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
    
    func map(withFrame frame: CGRect, initialCoordinates: CLLocationCoordinate2D) -> UIView {
        if mapView == nil {
            mapView = MGLMapView(frame: frame, styleURL: MGLStyle.outdoorsStyleURL())
            mapView.delegate = self
            mapView.setCenter(initialCoordinates, animated: false)
            mapView.zoomLevel = 13
        }
        
        return mapView
    }
    
    // MARK: MGLMapViewDelegate
    
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        let title = annotation.title!
        if let imageName = imageInfo[title!] {
            var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: imageName)
            if annotationImage == nil {
                var image = UIImage(named: imageName)!
                image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0,
                                                                   left: 0,
                                                                   bottom: image.size.height/2,
                                                                   right: 0))
                annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: imageName)
            }
            return annotationImage
        }
        
        return nil
    }
    
    func mapView(_ mapView: MGLMapView,
                 annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
}
