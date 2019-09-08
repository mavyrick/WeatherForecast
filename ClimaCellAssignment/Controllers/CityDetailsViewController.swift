//
//  CityDetailsViewController.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 04/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit
import MapKit
import Charts

class CityDetailsViewController: UIViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var locationMap: MKMapView!
    
    var cityDetailsFromHome: Capital?
    
    var dataFromMap: MKAnnotation?
    
    var segueName: String?
    
    var forecastData = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        self.title = cityDetailsFromHome?.capital
        
        if segueName == "ShowCityDetails" {
            
            getDataIfFromHome(countryCode: cityDetailsFromHome?.countryCode ?? "")
            
            self.title = cityDetailsFromHome?.capital
        } else {
            getDataIfFromMap()
            
            let latitude = dataFromMap?.coordinate.latitude ?? 0
            let longitude = dataFromMap?.coordinate.longitude ?? 0
            loadMap(lat: latitude, lon: longitude)
            
            self.title = dataFromMap?.title ?? ""
        }
    }
    
//  As requested I used the restcountries.eu API for the data. The coordinates from this API are not for the capital cities but for the country itself. Because of this I had to link to another country API that provides the capital coordinates. restcountries.eu does provide data for some of the lesser known countries that the other API doesn't provide so it's still worth using.
    private func getDataIfFromHome(countryCode: String) {
        GetCapitalCoordinates.shared.getCapitalCoordinates(countryCode: countryCode) { (capitalCoordinates) -> Void in
            let latitude = Double(capitalCoordinates?[0].latitude ?? "0")!
            let longitude = Double(capitalCoordinates?[0].longitude ?? "0")!
            
            self.loadMap(lat: latitude, lon: longitude)
            
            GetForecastData.shared.getForecastData(lat: latitude, lon: longitude) { (forecastData) -> Void in
                self.forecastData = forecastData
                self.forecastTableView.reloadData()
            }
        }
    }
    
//  For the map I just used the other API to makes thing quick.
    private func getDataIfFromMap() {
        let latitude = Double(dataFromMap?.coordinate.latitude ?? 0)
        let longitude = Double(dataFromMap?.coordinate.longitude ?? 0)
        print(latitude)
        GetForecastData.shared.getForecastData(lat: latitude, lon: longitude) { (forecastData) -> Void in
            self.forecastData = forecastData
            self.forecastTableView.reloadData()
        }
    }
    
    private func loadMap(lat: Double, lon: Double) {
        let location = CLLocationCoordinate2D(latitude: lat,
                                              longitude: lon)
        
        let span = MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
        let region = MKCoordinateRegion(center: location, span: span)
        locationMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = cityDetailsFromHome?.capital
        annotation.subtitle = cityDetailsFromHome?.country
        locationMap.addAnnotation(annotation)
    }
}

extension CityDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Forecast"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastTableViewCell
        
        let forecast = forecastData[indexPath.row]
        
        cell.forecast = forecast
        
        cell.selectionStyle = .none
        
        return cell
    }
}

