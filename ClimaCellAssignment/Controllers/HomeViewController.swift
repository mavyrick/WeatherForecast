//
//  HomeViewController.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 04/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var capitalData = [Capital]()
    
    var filteredCapitalData = [Capital]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search capitals and countries"
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(showMap))
        
        getCapitalData()
    }
    
    //  Fetching data from restcountries.eu
    private func getCapitalData(){
        GetCapitalData.shared.getCapitalData() { (capitalData) -> Void in
            self.capitalData = capitalData
            self.homeTableView.reloadData()
        }
    }
    
    @objc private func showMap() {
        self.performSegue(withIdentifier: "ShowMap", sender: self)
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCapitalData = capitalData.filter({( capital : Capital) -> Bool in
            return (capital.capital?.lowercased().contains(searchText.lowercased()) ?? false
                || capital.country?.lowercased().contains(searchText.lowercased()) ?? false)
        })
        
        homeTableView.reloadData()
    }
    
    private func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCityDetails" {
            if let indexPath = homeTableView.indexPathForSelectedRow {
                let capitalDetails: Capital
                let row = indexPath.row
                if isFiltering() {
                    capitalDetails = filteredCapitalData[row]
                } else {
                    capitalDetails = capitalData[row]
                }
                
                let controller = segue.destination as! CityDetailsViewController
                controller.cityDetailsFromHome = capitalDetails
                controller.segueName = segue.identifier
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCapitalData.count
        } else {
            return capitalData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CapitalCell", for: indexPath)
        
        let capital: Capital
        let row = indexPath.row
        
        if isFiltering() {
            capital = filteredCapitalData[row]
        } else {
            capital = capitalData[row]
        }
        
        cell.textLabel?.text = capital.capital
        
        cell.detailTextLabel?.text = capital.country
        
        // A lot faster than converting an SVG or making another API request :)
        let flagView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let flagLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        flagLabel.text = String.emojiFlagFromCode(capitalCode: capital.countryCode ?? "")
        flagLabel.font = UIFont(name: "AppleColorEmoji", size: 50)
        flagView.addSubview(flagLabel)
        cell.accessoryView = flagLabel
        
        return cell
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension String {
    static func emojiFlagFromCode(capitalCode: String) -> String? {
        guard Locale.isoRegionCodes.contains(capitalCode) else {
            return nil
        }
        var flagString = ""
        for s in capitalCode.unicodeScalars {
            guard let scalar = UnicodeScalar(127397 + s.value) else {
                continue
            }
            flagString.append(String(scalar))
        }
        return flagString
    }
}
