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
    
    func getData() {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIKeys.darkSkyKey)/\(coordinates)"
        print("🕸 We are accessing the url \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            return
        }
        
        // Create Session
        let session = URLSession.shared
        
        // Get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            
            // Note: there are some additional things that could go wrong when using URL session, but we shouldn't experience them, so we'll ignore testing for these things for now...
            
            // Deal with the data
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("😎 \(json)")
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
