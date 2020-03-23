//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Ronan Manvelian on 3/4/20.
//  Copyright © 2020 Ronan Manvelian. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
