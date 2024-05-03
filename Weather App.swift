import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getWeatherButtonTapped(_ sender: UIButton) {
        guard let city = cityTextField.text else { return }
        fetchWeatherData(for: city)
    }
    
    func fetchWeatherData(for city: String) {
        // Replace the URL below with your weather API endpoint
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=YOUR_API_KEY"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching weather data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.updateUI(with: weatherData)
                }
            } catch {
                print("Error decoding weather data: \(error)")
            }
        }
        task.resume()
    }
    
    func updateUI(with weatherData: WeatherData) {
        temperatureLabel.text = "\(weatherData.main.temp)°C"
        weatherDescriptionLabel.text = weatherData.weather.first?.description
    }
}

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
