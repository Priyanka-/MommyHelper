//
//  FirstViewController.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/1/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit
import os.log

class RecordFeedViewController: UIViewController {
    
    var feedPersister = FeedPersister()
    var feedsByDay : [Date : [Feed]]?
    
    @IBOutlet weak var firstOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstOutlet.layer.cornerRadius = 15
        firstOutlet.layer.borderWidth = 5
        firstOutlet.layer.borderColor = UIColor.purple.cgColor
        // Do any additional setup after loading the view, typically from a nib.
        feedsByDay = feedPersister.loadFeeds()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let currentDate = Date()
        let feed = Feed.init(timeOfFeed: currentDate)
        let feedsManipulator = InMemoryFeedsManipulator()
        feedsByDay = feedsManipulator.addFeed(feed: feed, feeds: feedsByDay)
       
        feedPersister.saveFeeds(feeds: feedsByDay!)
        print(feedsByDay as Any)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

