//
//  File.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 06/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

class GetCapitalData {
    
    static let shared = GetCapitalData()
    
    var isRequestPending = false
    
    private init() {
    }
    
    func getCapitalData(completed: @escaping ([Capital]) -> ()) -> () {
        
        if isRequestPending { return }
        
        isRequestPending = true
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoder = JSONDecoder()
                let capitalData = try decoder.decode([Capital].self, from: data)
                
                DispatchQueue.main.async {
                    let sortedByCapital = capitalData.sorted { $0.capital ?? "" < $1.capital ?? "" }
                    let home = HomeViewController()
                    home.capitalData = sortedByCapital
                    completed(sortedByCapital)
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
