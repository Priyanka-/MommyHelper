//
//  FeedHistoryTableViewController.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/2/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit
//TODO: reload this view everytime tab loads

class FeedHistoryTableViewController : UITableViewController {
    
    //MARK: Properties
    
    var feedsByDay = [[Feed]]()
    
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
        if (feedsForDay.count > 0) {
            let feed = feedsForDay[0]
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateStyle = DateFormatter.Style.short
            
            cell.dayLabel.text = dateFormatter.string(from: feed.timeOfFeed)
            
            cell.numberOfFeedsLabel.text = "\(feedsForDay.count) feeds"

        }
        
        // Configure the cell...
        
        return cell
    }
    
    //MARK: Private Methods
    private func loadFeedHistory() {
        let feedPersister = FeedPersister()
        let allFeeds = feedPersister.loadFeeds()
        if (allFeeds != nil ) {
            feedsByDay = Array((allFeeds?.values)!)
        }else {
            feedsByDay = [[Feed]]()
        }
        feedsByDay = feedsByDay.sorted(by: { $0[0].timeOfFeed > $1[0].timeOfFeed })
    }
}
