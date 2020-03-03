//
//  SavedWeatherViewController.swift
//  OnrampProject
//
//  Created by Momo Khan on 3/3/20.
//

import UIKit

class SavedWeatherViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadList), name: NSNotification.Name(rawValue: "reload"), object: nil)
    }
    
    // MARK: - Populate Tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.array(forKey: "Cities")!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        cell.textLabel?.text = UserDefaults.standard.array(forKey: "Cities")![indexPath.row] as? String
        
        return cell
    }
    
    @objc func reloadList(notification: NSNotification) {
        print("reloading")
        self.tableView.reloadData()
    }
    
    
}



