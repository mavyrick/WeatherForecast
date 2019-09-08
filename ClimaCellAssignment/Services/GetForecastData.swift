//
//  GetForecast.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 06/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

class GetForecastData {
    
    static let shared = GetForecastData()
    
    var isRequestPending = false
    
    private init() {
    }
    
    func getForecastData(lat: Double, lon: Double, completed: @escaping ([Forecast]) -> ()) -> () {
        
        if isRequestPending { return }
        
        isRequestPending = true
        
        let formattedFutureDate = getDate()
        
        guard let url = URL(string: "https://api.climacell.co/v3/weather/forecast/daily?lat=\(lat)&lon=\(lon)&end_time=\(formattedFutureDate)&fields=temp,precipitation,precipitation_probability") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("mFW54hIC4r5puNkKBrcfQ3Xy3dqFYXCJ", forHTTPHeaderField: "apikey")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let forecastData = try decoder.decode([Forecast].self, from: data)
                
                DispatchQueue.main.async {
                    completed(forecastData)
                }
                
                self.isRequestPending = false
                
                return
                
            } catch let err {
                print("Err", err)
            }
            
        }
        
        task.resume()
        
    }
    
    private func getDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let addFiveDays = calendar.date(byAdding: .day, value: 4, to: date)
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return format.string(from: addFiveDays!)
    }
    
}
