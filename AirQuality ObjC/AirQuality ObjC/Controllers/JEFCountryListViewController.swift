//
//  JEFCountryListViewController.swift
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class JEFCountryListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var countriesArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        JEFCityAirQualityController.fetchSupportedCountries { (countries) in
            DispatchQueue.main.async {
                self.countriesArray = countries;
                self.tableView.reloadData();
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStates"{
            if let destinationVC = segue.destination as? JEFStatesListViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let country = countriesArray[index.row]
                    destinationVC.country = country
                }
            }
        }
    }
}

extension JEFCountryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.textLabel?.text = countriesArray[indexPath.row]
        return cell
    }
}
