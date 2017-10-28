//
//  FilterViewController.swift
//  MapBoxPlayground
//
//  Created by Martin Mitrevski on 25.10.17.
//  Copyright © 2017 Mitrevski. All rights reserved.
//

import UIKit

protocol FilterDelegate {
    func filterUpdated(withState newState: MapState)
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "cellIdentifier"
    var mapService: MapService!
    var delegate: FilterDelegate?
    var state: MapState!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Filter"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.filterUpdated(withState: state)
    }
    
    // MARK: UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return mapService.supportedMapTypes().count
        } else {
            return mapService.supportedEntryTypes().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if indexPath.section == 0 {
            let mapType = mapService.supportedMapTypes()[indexPath.row]
            cell?.textLabel?.text = mapType.name
            cell?.accessoryType =
                mapType.name == state.selectedMapType.name ? .checkmark : .none
        } else {
            let entryType = mapService.supportedEntryTypes()[indexPath.row]
            cell?.textLabel?.text = entryType.entryTitle
            cell?.accessoryType = state.selectedEntryTypes.contains(entryType) ? .checkmark : .none
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Map style"
        } else {
            return "Show on map"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            state.selectedMapType = mapService.supportedMapTypes()[indexPath.row]
        } else {
            let entryType = mapService.supportedEntryTypes()[indexPath.row]
            if state.selectedEntryTypes.contains(entryType) {
                let index = state.selectedEntryTypes.index(of: entryType)!
                state.selectedEntryTypes.remove(at: index)
            } else {
                state.selectedEntryTypes.append(entryType)
            }
        }
        tableView.reloadData()
    }

}
