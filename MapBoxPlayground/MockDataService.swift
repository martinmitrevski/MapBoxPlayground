//
//  MockDataService.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 28.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import UIKit
import Mapbox

class MockDataService: NSObject {
    class func supportedMapTypes() -> [MapType] {
        let outdoors = MapType(name: "Outdoors", url: MGLStyle.outdoorsStyleURL())
        let streets = MapType(name: "Streets", url: MGLStyle.streetsStyleURL())
        let light = MapType(name: "Light Style", url: MGLStyle.lightStyleURL())
        let dark = MapType(name: "Dark Style", url: MGLStyle.darkStyleURL())
        let satelite = MapType(name: "Satellite", url: MGLStyle.satelliteStyleURL())
        
        return [outdoors, streets, light, dark, satelite]
    }
    
    class func supportedEntryTypes() -> [EntryType] {
        let pharmacy = EntryType(entryTitle: "Pharmacy", imageName: "pharmacy.png")
        let shop = EntryType(entryTitle: "Shop", imageName: "shop.png")
        let gasStation = EntryType(entryTitle: "Gas Station", imageName: "gasStation.png")
        let foodAndDrink = EntryType(entryTitle: "Food and Drink", imageName: "food.png")
        
        return [pharmacy, shop, gasStation, foodAndDrink]
    }
    
    class func mapEntries() -> [String: [MapEntry]] {
        let entryTypes = self.supportedEntryTypes()
        let medicaPlus = MapEntry(entryType: entryTypes[0],
                                  title: "MedicaPlus Pharm",
                                  location: CLLocationCoordinate2DMake(41.117053, 20.802511),
                                  entryId: "1")
        let groceryShop = MapEntry(entryType: entryTypes[1],
                                   title: "Grocery Shop",
                                   location: CLLocationCoordinate2DMake(41.115990, 20.803961),
                                   entryId: "2")
        let market = MapEntry(entryType: entryTypes[1],
                              title: "Supermarket",
                              location: CLLocationCoordinate2DMake(41.113087, 20.808531),
                              entryId: "3")
        let petShop = MapEntry(entryType: entryTypes[1],
                              title: "Pet Shop",
                              location: CLLocationCoordinate2DMake(41.114387, 20.800849),
                              entryId: "4")
        let gasStation1 = MapEntry(entryType: entryTypes[2],
                                  title: "Gas Station 1",
                                  location: CLLocationCoordinate2DMake(41.106360, 20.815226),
                                  entryId: "5")
        let gasStation2 = MapEntry(entryType: entryTypes[2],
                                   title: "Gas Station 2",
                                   location: CLLocationCoordinate2DMake(41.121694, 20.794659),
                                   entryId: "6")
        let gasStation3 = MapEntry(entryType: entryTypes[2],
                                   title: "Gas Station 3",
                                   location: CLLocationCoordinate2DMake(41.118501, 20.799294),
                                   entryId: "7")
        let foodAndDrink1 = MapEntry(entryType: entryTypes[3],
                                     title: "F&D 1",
                                     location: CLLocationCoordinate2DMake(41.120490, 20.795281),
                                     entryId: "8")
        let foodAndDrink2 = MapEntry(entryType: entryTypes[3],
                                     title: "F&D 2",
                                     location: CLLocationCoordinate2DMake(41.113151, 20.800603),
                                     entryId: "9")
        let foodAndDrink3 = MapEntry(entryType: entryTypes[3],
                                     title: "F&D 3",
                                     location: CLLocationCoordinate2DMake(41.112706, 20.802341),
                                     entryId: "10")
        let foodAndDrink4 = MapEntry(entryType: entryTypes[3],
                                     title: "F&D 4",
                                     location: CLLocationCoordinate2DMake(41.111704, 20.801526),
                                     entryId: "11")
        let foodAndDrink5 = MapEntry(entryType: entryTypes[3],
                                     title: "F&D 5",
                                     location: CLLocationCoordinate2DMake(41.111494, 20.802459),
                                     entryId: "12")
        
        return [entryTypes[0].entryTitle : [medicaPlus],
                entryTypes[1].entryTitle : [groceryShop, market, petShop],
                entryTypes[2].entryTitle : [gasStation1, gasStation2, gasStation3],
                entryTypes[3].entryTitle :
                    [foodAndDrink1, foodAndDrink2, foodAndDrink3, foodAndDrink4, foodAndDrink5]
        ]
    }
}


