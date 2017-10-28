//
//  MapView.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 25.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit
import CoreLocation

protocol MapView : class {
    func map(withFrame frame: CGRect, initialCoordinates: CLLocationCoordinate2D) -> UIView
    func update(withMapType mapType: MapType, entries: [MapEntry])
}
