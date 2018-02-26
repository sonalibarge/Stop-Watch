//
//  TimerTableViewCell.swift
//  Day1(StopWatch)
//
//  Created by Sonali on 1/8/18.
//  Copyright © 2018 Sonali. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var totalDifferenceLabel: UILabel!
    @IBOutlet weak var timerDifferenceCounter: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
