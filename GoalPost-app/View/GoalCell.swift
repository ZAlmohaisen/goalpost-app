//
//  GoalCell.swift
//  GoalPost-app
//
//  Created by Ziyad almohisen on 30/04/2019.
//  Copyright © 2019 Ziyad almohisen. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriotionLbl: UILabel!
    
    @IBOutlet weak var goalTypeLbl: UILabel!
    
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(description: String, Type: GoalType, goalProgressAmount: Int) {
        self.goalDescriotionLbl.text = description
        self.goalTypeLbl.text = Type.rawValue
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
        
    }
    
}
