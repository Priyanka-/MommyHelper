//
//  Feed.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/2/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import Foundation
import os.log

class Feed : NSObject, NSCoding {
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("babyActivities")
    
    //MARK: Properties
    var timeOfFeed : Date
   
    //MARK: Types
    struct PropertyKey {
        static let timeOfFeed = "timeOfFeed"
    }
    
    //MARK: Initialization
    init(timeOfFeed: Date) {
        self.timeOfFeed = timeOfFeed
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(timeOfFeed, forKey: PropertyKey.timeOfFeed)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The timeOfFeed is required. If we cannot decode a timeOfFeed string, the initializer should fail.
        guard let timeOfFeed = aDecoder.decodeObject(forKey: PropertyKey.timeOfFeed) as? Date else {
            os_log("Unable to decode the name for a Feed object.", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(timeOfFeed:timeOfFeed)
    }
    /*
    //MARK: Utility methods
    class func sortByDays(feeds: [Feed]) -> [Date : [Feed]] {
        var feedsByDay = [Date : [Feed]]()
        if (feeds.count < 1) {
            return feedsByDay
        }
        let calendar = NSCalendar.current
        var currentlyTraversedDate = feeds[0].timeOfFeed
        var feedsForCurrentDay = [Feed]()
        var currentlyTraversedDay = calendar.component(.day, from: currentlyTraversedDate)
        var currentlyTraversedMonth = calendar.component(.month, from: currentlyTraversedDate)
        var currentlyTraversedYear = calendar.component(.year, from: currentlyTraversedDate)

        var count = 1;
        var deleteFlagOn = false
        
        for item in feeds {
            if (deleteFlagOn) {
                //Delete this item from persistent storage
            }
            let itemDay = calendar.component(.day, from: item.timeOfFeed)
            let itemMonth = calendar.component(.month, from: item.timeOfFeed)
            let itemYear = calendar.component(.year, from: item.timeOfFeed)
            
            if (itemDay == currentlyTraversedDay && itemMonth == currentlyTraversedMonth && itemYear == currentlyTraversedYear) {
                feedsForCurrentDay.append(item)
            } else {
                feedsByDay[currentlyTraversedDate] = feedsForCurrentDay
                //Feeds for another day have started
                count = count + 1
                //Check if max number of days worth of data is already there
                if count == maxNumberOfDays {
                    //Delete all items after this from persistent storage
                    deleteFlagOn = true
                    
                    
                } else {
                    currentlyTraversedDate = item.timeOfFeed
                    currentlyTraversedDay = calendar.component(.day, from: currentlyTraversedDate)
                    currentlyTraversedMonth = calendar.component(.month, from: currentlyTraversedDate)
                    currentlyTraversedYear = calendar.component(.year, from: currentlyTraversedDate)
                    feedsForCurrentDay = [Feed]()
                    feedsForCurrentDay.append(item)
                }
            }
        }
        
        return feedsByDay
    }*/
    
}
