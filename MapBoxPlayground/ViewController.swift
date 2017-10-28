//
//  ViewController.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 24.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, FilterDelegate {
    
    var mapView: MapView = MapBoxView()
    let mapService: MapService = MapBoxService()
    var state: MapState!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialCoordinates = CLLocationCoordinate2DMake(41.116860, 20.802873)
        view.addSubview(mapView.map(withFrame: self.view.bounds,
                                    initialCoordinates: initialCoordinates))
        setupInitialState()
    }
    
    private func setupInitialState() {
        state = MapState(selectedMapType: mapService.defaultMapType(),
                         selectedEntryTypes: mapService.supportedEntryTypes())
        mapView.update(withMapType: state.selectedMapType,
                       entries: mapService.mapEntries(forSelectedTypes: state.selectedEntryTypes))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilter" {
            let next = segue.destination as! FilterViewController
            next.delegate = self
            next.state = state
            next.mapService = mapService
        }
    }
    
    func filterUpdated(withState newState: MapState) {
        state = newState
        mapView.update(withMapType: state.selectedMapType,
                       entries: mapService.mapEntries(forSelectedTypes: state.selectedEntryTypes))
    }

}

