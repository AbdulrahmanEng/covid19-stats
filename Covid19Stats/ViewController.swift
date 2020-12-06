//
//  ViewController.swift
//  Covid19Stats
//
//  Created by Abdulrahman on 04/12/2020.
//

import UIKit

class ViewController: UITableViewController {
    var countries: [Country] = []
    
    // Load data
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://corona-api.com/countries")
        
        guard let u = url else {
            return
        }
        
        URLSession.shared.dataTask(with: u) {
            (data, response, error) in
                guard let data = data else {
                    return
                }
            do {
                let countryList = try JSONDecoder().decode(CountryList.self, from: data)
                self.countries = countryList.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("\(error)")
            }
        }.resume()
    }

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

