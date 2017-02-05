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
    
}

