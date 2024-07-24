//
//  ViewController.swift
//  _8829850_Lab8
//
//  Created by user228704 on 7/28/23.
//


import UIKit
import CoreLocation
import MapKit
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}


class ViewController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate{


    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var weatherTempreture: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    
    let manager  = CLLocationManager()
    let API_KEY = "51be64dad38b0e7be45ce6b911d789de"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.getWWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
    }
    func getWWeatherData( latitude : CLLocationDegrees,  longitude : CLLocationDegrees) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(API_KEY)";
        let semaphore = DispatchSemaphore (value: 0)

        var request = URLRequest(url: URL(string: urlString)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
          let jsonDecoder = JSONDecoder()
            do{
                let weatherData = try
                    jsonDecoder.decode(Welcome.self, from: data)
                print(weatherData)
                
                DispatchQueue.main.async {
                    self.cityName.text = "\(weatherData.name)"
                    self.weatherType.text = "\(weatherData.weather[0].description)"
                    self.weatherTempreture.text = "\(String(format: "%.1f", weatherData.main.temp - 273.15))°"
                    self.humidity.text = "Humidity : \(weatherData.main.humidity)%"
                    self.windSpeed.text = "Wind : \(String(format: "%.1f", weatherData.wind.speed * 3.6)) km/h"
                    let iconURLString = "https://openweathermap.org/img/wn/\(weatherData.weather[0].icon).png"
                    self.setImage(from: iconURLString)
                }
                
            }catch{
                print("Can't Decode")
            }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

        
    }
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.main.async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.weatherImage.image = image
            }
        }
    }
}
