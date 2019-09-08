////
////  backup.swift
////  ClimaCellAssignment
////
////  Created by Josh Sorokin on 05/09/2019.
////  Copyright © 2019 Josh Sorokin. All rights reserved.
////
//
////
////  CityDetailsViewController.swift
////  ClimaCellAssignment
////
////  Created by Josh Sorokin on 04/09/2019.
////  Copyright © 2019 Josh Sorokin. All rights reserved.
////
//
//import UIKit
//
//class CityDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet weak var cityName: UILabel!
//    @IBOutlet weak var forecastTableView: UITableView!
//
//    var cityDetails: Country? {
//        didSet {
//            print("TEST SET")
//            print(cityDetails?.capital)
//            configureView()
//        }
//    }
//
//    var forecastData = [Forecast]()
//
//    func configureView() {
//        if let cityDetails = cityDetails {
//            print("TEST: \(cityDetails.capital!)")
//            print("TEST: \(cityDetails.latlng!)")
//            if let cityName = cityName {
//                //        if let cityDetails = cityDetails {
//                cityName.text = cityDetails.capital!
//                cityName.textColor = UIColor.blue
//                //        }
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        forecastTableView.delegate = self
//        forecastTableView.dataSource = self
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        cityName.text = cityDetails?.capital
//        getForecast(lat: cityDetails?.latlng?[0] ?? 0, lon: cityDetails?.latlng?[1] ?? 0)
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return forecastData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath) as! ForecastTableViewCell
//
//        let forecast = forecastData[indexPath.row]
//
//        cell.forecast = forecast
//
//        cell.selectionStyle = .none
//
//        return cell
//
//    }
//
//    func getForecast(lat: Double, lon: Double) {
//
//        guard let url = URL(string: "https://api.climacell.co/v3/weather/forecast/daily?lat=\(lat)&lon=\(lon)&end_time=2019-09-10T00:00:00Z&fields=temp,precipitation,precipitation_probability") else { return }
//
//        var request = URLRequest(url: url)
//
//        request.setValue("mFW54hIC4r5puNkKBrcfQ3Xy3dqFYXCJ", forHTTPHeaderField: "apikey")
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//
//                let decoder = JSONDecoder()
//                let forecastData = try decoder.decode([Forecast].self, from: data)
//
//                self.forecastData = forecastData
//
//                DispatchQueue.main.async {
//
//                    self.forecastTableView.reloadData()
//
//                }
//
//                return
//
//            } catch let err {
//                print("Err", err)
//            }
//
//        }
//
//        task.resume()
//
//    }
//
//}

//import Foundation
//
//class GetForecastData {
//
//    var forecastData = [Forecast]()
//    
//    func getForecastData(lat: String, lon: String, completed: @escaping () -> ()) {
//
//        //func getForecastData(completed: @escaping ([Forecast]) -> ()) -> () {
//
//        let date = Date()
//        let calendar = Calendar.current
//        let addFiveDays = calendar.date(byAdding: .day, value: 4, to: date)
//        let format = DateFormatter()
//        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
//        let formattedFutureDate = format.string(from: addFiveDays!)
//
//        guard let url = URL(string: "https://api.climacell.co/v3/weather/forecast/daily?lat=\(lat)&lon=\(lon)&end_time=\(formattedFutureDate)&fields=temp,precipitation,precipitation_probability") else { return }
//
//        var request = URLRequest(url: url)
//
//        request.setValue("mFW54hIC4r5puNkKBrcfQ3Xy3dqFYXCJ", forHTTPHeaderField: "apikey")
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//
//                let decoder = JSONDecoder()
//                let forecastData = try decoder.decode([Forecast].self, from: data)
//
//                DispatchQueue.main.async {
//
//                    self.forecastData = forecastData
//
//                    print("SDLKFJSDLKFLJKS")
//
//                    completed()
//
//                }
//
//                return
//
//            } catch let err {
//                print("Err", err)
//            }
//
//        }
//
//        task.resume()
//
//    }
//
//}
