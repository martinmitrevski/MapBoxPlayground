//
//  MapEntry.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 25.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import Foundation
import CoreLocation

struct MapType {
    let name: String
    let url: URL
}

struct EntryType : Equatable {
    static func ==(lhs: EntryType, rhs: EntryType) -> Bool {
        return lhs.entryTitle == rhs.entryTitle && lhs.imageName == rhs.imageName
    }
    
    let entryTitle: String
    let imageName: String
}

struct MapState {
    var selectedMapType: MapType
    var selectedEntryTypes: [EntryType]
}

struct MapEntry {
    let entryType: EntryType
    let title: String
    let location: CLLocationCoordinate2D
    let entryId: String
}
