//
//  ContinentsViewController.swift
//  TableView-Introduction
//
//  Created by Brendon Crowe on 12/18/22.
//

import UIKit

class ContinentsViewController: UIViewController {
    
    
    @IBOutlet weak var continentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continentTableView.dataSource = self
        
        // test continent section
        dump(Country.getSections())
        
        
    }
}



extension ContinentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row + 1)"
        return cell
    }
    
    
}





