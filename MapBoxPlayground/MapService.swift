//
//  MapServiceProtocol.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 25.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import Foundation

protocol MapService : class {
    func defaultMapType() -> MapType
    func supportedMapTypes() -> [MapType]
    func supportedEntryTypes() -> [EntryType]
    func mapEntries() -> [String: [MapEntry]]
    func mapEntries(forSelectedTypes entryTypes: [EntryType]) -> [MapEntry]
}
