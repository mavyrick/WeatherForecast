//
//  MapViewController.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 08/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var capitalsMap: MKMapView!
    
    var cityDetails: Capital?
    
    var dataToSend: MKAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        capitalsMap.delegate = self
        
        getData()
        
        let location = CLLocationCoordinate2D(latitude: 50, longitude: 50)
        
        let span = MKCoordinateSpan(latitudeDelta: 175, longitudeDelta: 175)
        let region = MKCoordinateRegion(center: location, span: span)
        capitalsMap.setRegion(region, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
//   Fetching data from api.worldbank.org, not restcountries.eu
    private func getData() {
        GetCapitalCoordinates.shared.getCapitalCoordinates(countryCode: "all") { (capitalData) -> Void in
            self.createAnnotations(capitalData: capitalData!)
        }
    }
    
    private func createAnnotations(capitalData: [CapitalCoordinates]) {
        for capital in capitalData {
            let annotations = MKPointAnnotation()
            print(capital.capitalCity!)
            annotations.title = capital.capitalCity
            let lat = Double(capital.latitude ?? "0") ?? 0
            let lon = Double(capital.longitude ?? "0") ?? 0
            annotations.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            capitalsMap.addAnnotation(annotations)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapToDetails" {
            let controller = segue.destination as! CityDetailsViewController
            controller.dataFromMap = dataToSend
            controller.segueName = segue.identifier
        }
    }
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.dataToSend = view.annotation
        performSegue(withIdentifier: "MapToDetails", sender: self)
    }
}


