//
//  JEFCityViewController.swift
//  AirQuality ObjC
//
//  Created by Jordan Furr on 3/26/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import UIKit

class JEFCityViewController: UIViewController {
    

    @IBOutlet weak var citylabel: UILabel!
    @IBOutlet weak var statelabel: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
    @IBOutlet weak var aqlabel: UILabel!
    @IBOutlet weak var templabel: UILabel!
    @IBOutlet weak var humidlabel: UILabel!
    @IBOutlet weak var windlabel: UILabel!
    
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var objectThing = JEFCityAirQuality()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city
        JEFCityAirQualityController.fetchCity(city, state: state, country: country) { (airQualityObject) in
            DispatchQueue.main.async {
                self.objectThing = airQualityObject;
                self.updateViews()
            }
        }
    }
    
    func updateViews(){
        let cityName = objectThing.city
        citylabel.text = "City: \(cityName)"
        statelabel.text = "State: \(objectThing.state)"
        countrylabel.text = "Country: \(objectThing.country)"
        //
        aqlabel.text = "Air Quality: \(objectThing.pollution.airQualityIndex) "
        templabel.text = "Temperature: \(objectThing.weather.temperature) Degrees Celsius"
        humidlabel.text = "Humidity: \(objectThing.weather.humidity)"
        windlabel.text = "Wind Speed: \(objectThing.weather.windSpeed) KMPH?"
    }
 
}
