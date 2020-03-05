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
        if(UserDefaults.standard.array(forKey: "Cities") != nil) {
            loadCitiesWeather()
        }
        
    }
    
    // MARK: - Populate Tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        let weatherViewModel = weatherViewModels[indexPath.row]
        let subtitle = cell.detailTextLabel
        let title = cell.textLabel
        let image = cell.imageView
        
        subtitle?.text = "\(weatherViewModel.temperatureString)°F"
        title?.text = weatherViewModel.cityName
        image?.image = UIImage(systemName: weatherViewModel.conditionName)
        
        
        
        return cell
    }
    
    @objc func reloadList(notification: NSNotification) {
        loadCitiesWeather()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            weatherViewModels.remove(at: indexPath.row)
            var cities = UserDefaults.standard.array(forKey: "Cities") as! [String]
            cities.remove(at: indexPath.row)
            UserDefaults.standard.set(cities, forKey: "Cities")
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
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
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}



