//
//  GetCapitalCoordinates.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 06/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

class GetCapitalCoordinates {
    
    static let shared = GetCapitalCoordinates()
    
    var isRequestPending = false
    
    private init() {
    }
    
    func getCapitalCoordinates(countryCode: String, completed: @escaping (CapitalCoordinates?) -> ()) {
        
        if isRequestPending { return }
        
        isRequestPending = true
                
        guard let url = URL(string: "https://api.worldbank.org/v2/country/\(countryCode)?format=json") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in

            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let capitalData = try decoder.decode([CapitalCoordinatesBase].self, from: data)
                
                
                DispatchQueue.main.async {
                    if capitalData.count == 1 {
                        print("NO COORDINATES")
                    } else {
                        let capitalCoordinates = capitalData[1].capitalCoordinates?[0]
                        completed(capitalCoordinates)
                    }
                }
                    
                    self.isRequestPending = false
                
                return
                
            } catch let err {
                print("Err", err)
            }
            
        }
        
        task.resume()
        
    }
    
}
