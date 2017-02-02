//
//  FeedHistoryTableViewController.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/2/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit

class FeedHistoryTableViewController : UITableViewController {
    
    //MARK: Properties
    
    var feedsByDay = [FeedsByDay]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeedHistory()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsByDay.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FeedHistoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FeedHistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of FeedHistoryTableViewCell.")
        }
        
        // Fetches the appropriate feed history for the data source layout.
        let feedsForDay = feedsByDay[indexPath.row]
        if (feedsForDay.feeds.count > 0) {
            let feed = feedsForDay.feeds[0]
            let calendar = NSCalendar.current
            
            let month = calendar.component(.month, from: feed.timeOfFeed)
            let day = calendar.component(.day, from: feed.timeOfFeed)
            cell.dayLabel.text = "\(day) \(month)"
            
            cell.numberOfFeedsLabel.text = "\(feedsForDay.feeds.count) feeds"

        }
        
        // Configure the cell...
        
        return cell
    }
    
    //MARK: Private Methods
    
    private func loadFeedHistory() {
        let feed1 = Feed(timeOfFeed : Date())
        let oneHourAgo = Date(timeIntervalSinceNow: -3600)
        let feed2 = Feed(timeOfFeed: oneHourAgo)
        guard let feedsForToday = FeedsByDay(feeds : [feed1, feed2])
            else {
                fatalError("feedsForToday failed")
        }
        feedsByDay = [feedsForToday]
        
    }
}
