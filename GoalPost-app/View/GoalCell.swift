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
    
    @IBOutlet weak var completionView: UIView!
    func configureCell(goal: Goal) {
        self.goalDescriotionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalcompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
        
    }
    
}
