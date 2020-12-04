//
//  ViewController.swift
//  Covid19Stats
//
//  Created by Abdulrahman on 04/12/2020.
//

import UIKit

class ViewController: UITableViewController {
    let countries = [
        Country(name: "Norway", deaths: 40),
        Country(name: "Italy", deaths: 250),
        Country(name: "Japan", deaths: 100)
    ]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CountrySegue" {
            if let destination = segue.destination as? CountryViewController {
                destination.country = countries[tableView.indexPathForSelectedRow!.row]
            }
        }
    }

}

