//
//  InMemoryFeedsManipulator.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/5/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import Foundation

class InMemoryFeedsManipulator {
    
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
                    break
                }
            }
        } else {
            feedsByDay = [Date : [Feed]]()
        }
        
        if (!found) {
            feedsByDay?[currentDate] = [feed]
            //delete last day's data
            if (feedsByDay?.keys.count)! > Feed.maxNumberOfDays {
                let lowestDate = feedsByDay?.keys.min()
                let removedData = feedsByDay?.removeValue(forKey: lowestDate!)
                print("Removed data ")
                print(removedData as Any)
            }
        }
        return feedsByDay!
    }

}
