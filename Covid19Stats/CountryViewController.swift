//
//  CountryViewController.swift
//  Covid19Stats
//
//  Created by Abdulrahman on 04/12/2020.
//

import UIKit

class CountryViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var deathLabel: UILabel!
    
    var country: Country!
    
    override func viewDidLoad() {
        nameLabel.text = country.name
        deathLabel.text = String(format: "Deaths: %d", country.deaths)
    }
}
