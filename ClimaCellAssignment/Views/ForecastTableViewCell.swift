//
//  ForecastTableViewCell.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 05/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var precipitation: UILabel!
    @IBOutlet weak var precipitationProbability: UILabel!
    
    var forecast: Forecast?
    
    func updateUI() {
        
        minTemp.text = "\(Int(forecast?.temp?[0].min?.value ?? 0))°C"
        maxTemp.text = "\(Int(forecast?.temp?[1].max?.value ?? 0))°C"
        precipitation.text = "\(forecast?.precipitation?[0].max?.value ?? 0) mm/hr"
        precipitationProbability.text = "\(forecast?.precipitationProbability?.value ?? 0)%"
        
        day.text = forecast?.observationTime?.value?.dayOfWeek()
        
    }
    
}

extension String {
    func dayOfWeek() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.date(from: self)
        format.dateFormat = "EEEE, LLLL d"
        return format.string(from: formattedDate!)
    }
}

extension String {
    func formatObservationTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let formattedDate = format.date(from: self)
        format.dateFormat = "h:MM a"
        return format.string(from: formattedDate!)
    }
}
