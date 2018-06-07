//
//  ViewController.swift
//  testJSONDecoder
//
//  Created by osu on 2018/06/07.
//  Copyright © 2018 osu. All rights reserved.
//

import UIKit

struct Forecast: Codable {
    
    enum WeatherType: String, Codable {
        case sunny, cloudy, rainy, snowy
    }
    
    var dateString = ""
    var weeks: [WeatherType]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let sampleFile = Bundle.main.url(forResource: "sample", withExtension: "json") else {
            return
        }

        do {
            let sampleData = try Data(contentsOf: sampleFile)
            let decoder = JSONDecoder()
            let sampleJson = try decoder.decode(Forecast.self, from: sampleData)
            print("dateString: \(sampleJson.dateString)")
            print("weeks: ")
            sampleJson.weeks.forEach { print("  \($0)") }
        } catch {
            print(error)
        }
    }

}

