//
//  FirstViewController.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/1/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var numberOfFeeds : Int = 0

    @IBOutlet weak var firstOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        //TODO: record feed
        recordFeed()
        print("fed \(numberOfFeeds) times")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func recordFeed() {
        numberOfFeeds = numberOfFeeds + 1
    }

}

