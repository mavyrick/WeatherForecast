//
//  GetCapitals.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 02/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import Foundation

//class GetCountryData {
//    
//    var capitalData: [Capital]?
//
//    func getCountryData() {
//
//        guard let url = URL(string: "https://restcountries.eu/rest/v2/all") else { return }
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: url) { (data, response, error) in
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
//                let countryData = try decoder.decode([CountryData].self, from: data)
//
////                guard capital.success == true else {
////
////                    let alert = UIAlertController(title: "Upload Failure", message: "There was a problem uploading your photo.", preferredStyle: .alert)
////
////                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
////
////                    self.present(alert, animated: true)
////
////                    return
////
////                }
//
//                DispatchQueue.main.async {
//
//                   print(countryData)
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
