//
//  JEFStatesListViewController.swift
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class JEFStatesListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var country: String = ""
    var states: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = country
        tableView.dataSource = self
        tableView.delegate = self
        JEFCityAirQualityController.fetchSupportedStates(inCountry: country) { (states) in
            DispatchQueue.main.async {
                self.states = states
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCities"{
            if let destinationVC = segue.destination as? JEFCitiesListViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let state = states[index.row]
                    destinationVC.country = country
                    destinationVC.state = state
                }
            }
        }
    }
}

extension JEFStatesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        cell.textLabel?.text = states[indexPath.row]
        return cell
    }
}
