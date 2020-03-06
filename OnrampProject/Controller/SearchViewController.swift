//
//  ViewController.swift
//  OnrampProject
//
//  Created by Giovanni Noa on 2/20/20.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController {
    
    @IBOutlet weak var weatherConditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    var weatherAPIManager = WeatherAPIManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        cityTextField.delegate = self
        weatherAPIManager.delegate = self
    }
    
    @IBAction func saveCityPressed(_ sender: Any) {
        if let lastCity = self.defaults.string(forKey: "LastCity"){
            if var savedCities = self.defaults.array(forKey: "Cities"){
                if(!(savedCities as! [String]).contains(lastCity)) {
                    savedCities.append(lastCity)
                    self.defaults.set(savedCities, forKey: "Cities")
                }
            } else {
                self.defaults.set([lastCity], forKey: "Cities")
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
        }
    }
    
}

// MARK: - UITextFieldDelegate

extension SearchViewController: UITextFieldDelegate {
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        cityTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            //put an alert here later instead if time allows
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = cityTextField.text {
            weatherAPIManager.fetchWeather(cityName: city)
        }
        
        cityTextField.text = ""
    }
}

// MARK: - WeatherAPIManagerDelegate
extension SearchViewController: WeatherAPIManagerDelegate {
    func didUpdateWeather(_ weatherAPIManager: WeatherAPIManager, weather: WeatherViewModel) {
        DispatchQueue.main.async {
            self.weatherConditionImage.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            
            self.defaults.set(weather.cityName, forKey:"LastCity")
        }
    }
    
    func didFailWithError(error: Error) {
        let alert = UIAlertController(title: "Weather Update Failed", message: "Please make sure to enter a valid location", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - CLLocationManagerDelegate
extension SearchViewController: CLLocationManagerDelegate {
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherAPIManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "No Location Access", message: "Please go to setings to allow Weather authorization when in use", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
           
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(settingsAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}


