//
//  CreateGoalVC.swift
//  GoalPost-app
//
//  Created by Ziyad almohisen on 30/04/2019.
//  Copyright © 2019 Ziyad almohisen. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {
    
    //Outlets

    @IBOutlet weak var goalTextView: UITextView!
    
    @IBOutlet weak var shortTermBtn: UIButton!
    
    @IBOutlet weak var longTermBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       nextBtn.bindToKetboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeSelectedColor()
        goalTextView.delegate = self
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        if goalTextView.text != "" && goalTextView.text != "What is your goal ?" {
            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(descripation: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
        
    }
    
    @IBAction func shortTermPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeSelectedColor()
    }
    
    @IBAction func longTermPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeSelectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
