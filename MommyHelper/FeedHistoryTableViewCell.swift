//
//  FeedHistoryTableViewCell.swift
//  MommyHelper
//
//  Created by Priyanka Joshi on 2/2/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import UIKit

class FeedHistoryTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var numberOfFeedsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
