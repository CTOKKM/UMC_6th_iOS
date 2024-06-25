//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by KKM on 6/25/24.
//

import UIKit

// WeatherData 모델
struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

// WeatherManager 클래스
class WeatherManager {
    let apiKey = "6ac65320e6a1826da9139fb1c42f6871"
    lazy var urlString: String = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=\(apiKey)&units=metric"
    
    func fetchWeather(completion: @escaping (WeatherData?) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    completion(nil)
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let weatherData = try decoder.decode(WeatherData.self, from: safeData)
                        completion(weatherData)
                    } catch {
                        print(error)
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
    }
}

class WeatherViewController: UIViewController {
    private var weatherData: WeatherData? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }

    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        fetchWeather()
    }

    private func setupUI() {
        view.addSubview(weatherLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            weatherLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 20),
            temperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            temperatureLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

    private func fetchWeather() {
        WeatherManager().fetchWeather { [weak self] data in
            self?.weatherData = data
        }
    }

    private func updateUI() {
        if let weather = weatherData {
            weatherLabel.text = "서울의 날씨"
            temperatureLabel.text = "\(weather.main.temp)°C"
            descriptionLabel.text = weather.weather.first?.description.capitalized
        } else {
            weatherLabel.text = "날씨 정보를 불러오는 중..."
        }
    }
}


