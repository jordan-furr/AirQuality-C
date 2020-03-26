//
//  JEFCitiesListViewController.swift
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class JEFCitiesListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var state: String = ""
    var country: String = ""
    var cities: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = state
        tableView.delegate = self
        tableView.dataSource = self
        
        JEFCityAirQualityController.fetchSupportedCities(inState: state, country: country) { (cities) in
            DispatchQueue.main.async {
                self.cities = cities
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCity"{
            if let destinationVC = segue.destination as? JEFCityViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let city = cities[index.row]
                    destinationVC.country = country
                    destinationVC.city = city
                    destinationVC.state = state
                }
            }
        }
    }
}

extension JEFCitiesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cityCell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
    
}
