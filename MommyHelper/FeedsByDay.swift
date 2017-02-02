//
//  FeedsByDay.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/2/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import Foundation

class FeedsByDay {
    //MARK: Properties
    let maxNumberOfDays = 7
    
    var feeds = [Feed]()

    
    //MARK: Initialization
    
    init?(feeds: [Feed]) {
        if (feeds.count > maxNumberOfDays) {
            return nil
        }
        self.feeds = feeds
    }

}
