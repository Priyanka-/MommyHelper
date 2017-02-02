//
//  DayHistoryTableViewController.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/3/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit

class DayHistoryTableViewController: UITableViewController {

    var feedsForDay = [Feed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDayHistory()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsForDay.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DayHistoryTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Fetches the appropriate feed history for the data source layout.
        let feed = feedsForDay[indexPath.row]
        let calendar = NSCalendar.current
            
        let hour = calendar.component(.hour, from: feed.timeOfFeed)
        let minute = calendar.component(.minute, from: feed.timeOfFeed)
        cell.textLabel?.text = "\(hour):\(minute)"
        
        return cell
    }
    
    //MARK: Private Methods
    
    private func loadDayHistory() {
        let feed1 = Feed(timeOfFeed : Date())
        let oneHourAgo = Date(timeIntervalSinceNow: -3600)
        let feed2 = Feed(timeOfFeed: oneHourAgo)
        feedsForDay = [feed1, feed2]
        
    }

}
