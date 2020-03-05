//
//  SavedWeatherViewController.swift
//  OnrampProject
//
//  Created by Momo Khan on 3/3/20.
//

import UIKit

class SavedWeatherViewController: UITableViewController {
    
    var weatherAPIManager = WeatherAPIManager()
    var weatherViewModels = [WeatherViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherAPIManager.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadList), name: NSNotification.Name(rawValue: "reload"), object: nil)
        loadCitiesWeather()
    }
    
    // MARK: - Populate Tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        //let cityString = UserDefaults.standard.array(forKey: "Cities")![indexPath.row] as! String
        let weatherViewModel = weatherViewModels[indexPath.row]
        let title = cell.detailTextLabel
        let subtitle = cell.textLabel
        let image = cell.imageView
        subtitle?.text = "\(weatherViewModel.temperatureString)°F"
        subtitle?.textColor = UIColor.white
        title?.text = weatherViewModel.cityName
        title?.textColor = UIColor.white
        image?.image = UIImage(systemName: weatherViewModel.conditionName)
        
        
        return cell
    }
    
    @objc func reloadList(notification: NSNotification) {
        loadCitiesWeather()
        //self.tableView.reloadData()
    }
    
}

extension SavedWeatherViewController: WeatherAPIManagerDelegate {
    
    func loadCitiesWeather() {
        let cities:[String] = weatherViewModels.map{$0.cityName}
        for city in UserDefaults.standard.array(forKey: "Cities")! {
            if(!cities.contains(city as! String)) {
                weatherAPIManager.fetchWeather(cityName: city as! String)
            }
        }
        
    }
    func didUpdateWeather(_ weatherAPIManager: WeatherAPIManager, weather: WeatherViewModel) {
        DispatchQueue.main.async {
            //if the userdefault array doesnt have this one then add it
            self.weatherViewModels.append(weather)
            print(self.weatherViewModels.count)
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}



