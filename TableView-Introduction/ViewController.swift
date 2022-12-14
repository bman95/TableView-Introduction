//
//  ViewController.swift
//  TableView-Introduction
//
//  Created by Brendon Crowe on 12/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark:- Outlets and properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // data for the table view which is an array of [Country]
    // countries must be initialized
    private var countries = [Country]() { // initializes an empty array
        // property observer
        didSet {
            // reloads all the rows of the table view and the table view itself
            tableView.reloadData()
        }
    }
    
    private var sortAscending = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuring a table view
        // Step 1: set the datasource object, which is the ViewController (because we want the data to be loaded ONCE)
        // meaning the object that will provide the table view its data
        tableView.dataSource = self // is the ViewController instance
        
        // testing Data
        print("There are \(Country.countries.count) countries in our struct")
        
        sortData(true) // calling the helper function and passing in true
    }
    
    @IBAction func sortButtonPressed(_ sender: UIBarButtonItem) {
        sortAscending.toggle()
        sortData(sortAscending)
        
    }
    
    func sortData(_ sortAscending: Bool) {
        if sortAscending {
            countries = Country.countries.sorted { $0.name < $1.name } // < ascending
            // table view reloads because a property observing is being used
            // update the UIBarButtonItem title
            navigationItem.rightBarButtonItem?.title = "Sort Descending"
        } else {
            countries = Country.countries.sorted { $0.name > $1.name } // > descending
            navigationItem.rightBarButtonItem?.title = "Sort Ascending"
        }
    }
}

// Step2: conform to UITableViewDataSource protocol, which requires implementing two methods
extension ViewController: UITableViewDataSource {
    // 2 methods are required
    
    // method 1: number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  countries.count
    }
    
    // method 2: cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell recycles a cell if it exists; if the cell does not exist, a new cell is created
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        
        // get the object (country) at the current indexPath, which starts at 0
        let country = countries[indexPath.row]
        
        // configure the cell
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.description
        
        
        
        // IndexPath overview using an array of arrays (Matrix)
//        let arrayOfArrays = [[1, 2, 3],
//                             [4, 5, 6],
//                             [7, 8, 9]]
        // access a cell in a section
        // arrayOfArrays[indexPath.section][indexPath.row]
        // arrayOfArrays[0][0] prints out 1
        // arrayOfArrays[2][1] prints out 8
                
        // access an element without a section; an array by itself (not contained in another array)
        // let flatArray = [1, 2, 3]
        // flatArray[indexPath.row]
        
        
        return cell
    }
    
}
