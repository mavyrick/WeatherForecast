//
//  ViewController.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 02/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    @IBOutlet weak var capitalPicker: UIPickerView!
//    
////    var capitalData = [Capital]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        print("TEST")
//      
//        self.capitalPicker.delegate = self
//        self.capitalPicker.dataSource = self
//        
//        GetCapitalData().getCapitalData()
//    }
//    
////    func numberOfComponents(in pickerView: UIPickerView) -> Int {
////        return 1
////    }
////
////    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
////        return capitalData.count
////    }
////
////    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        return capitalData[row].capital
////    }
//
////    func getCapitals() {
////
////        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
////        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
////            if let error = error {
////                print("error: \(error)")
////            } else {
////                if let response = response as? HTTPURLResponse {
////                    print("statusCode: \(response.statusCode)")
////                }
////                if let data = data, let dataString = String(data: data, encoding: .utf8) {
////                    print("data: \(dataString)")
////                }
////            }
////        }
////        task.resume()
////
////}
//
//}
