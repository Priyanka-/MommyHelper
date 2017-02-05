//
//  FeedPersister.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/3/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import Foundation
import os.log

class FeedPersister {
    
    //MARK: Properties
    let maxNumberOfDays = 7
    var feedsByDays : [Date : [Feed]] = [Date : [Feed]]()
    
    
    //MARK: Methods to save in persistent storage
    func saveFeeds(feeds : [Date : [Feed]]) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(feeds, toFile: Feed.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Feeds successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save feeds...", log: OSLog.default, type: .error)
        }
    }
    
    //MARK: Methods to load from persistent storage
    func loadFeeds() -> [Date : [Feed]]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Feed.ArchiveURL.path) as? [Date : [Feed]]
    }
    
    //MARK: Method to add feed in feeds
    func addFeed(feed: Feed, feeds: [Date : [Feed]]?) -> [Date : [Feed]] {
        var feedsByDay = feeds
        let currentDate = feed.timeOfFeed
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentYear = calendar.component(.year, from: currentDate)
        
        var found = false
        
        if (feedsByDay != nil) {
            for date in (feedsByDay?.keys)! {
                let day = calendar.component(.day, from: date)
                let month = calendar.component(.month, from: date)
                let year = calendar.component(.year, from: date)
                if (day == currentDay && month == currentMonth && year == currentYear) {
                    feedsByDay?[date]?.append(feed)
                    found = true
                    //TODO: cut the loop now
                }
            }
        }
       
        if (!found) {
            feedsByDay = [Date : [Feed]]()
            feedsByDay?[currentDate] = [feed]
            //TODO: delete one day
            if (feedsByDay?.keys.count)! > maxNumberOfDays {
                
            }
        }
        return feedsByDay!
    }
    
}

