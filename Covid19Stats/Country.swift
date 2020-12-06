//
//  Country.swift
//  Covid19Stats
//
//  Created by Abdulrahman on 04/12/2020.
//

import Foundation

struct CountryList: Codable {
    let data: [Country]
}

struct Country: Codable {
    let name: String
    let today: CountryToday
    let coordinates: CountryCoordinates
}

// Today's stats
struct CountryToday: Codable {
    let deaths: Int
    let confirmed: Int
}

// Coordinates
struct CountryCoordinates: Codable {
    let longitude: Double?
    let latitude: Double?
}
