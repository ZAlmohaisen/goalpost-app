//
//  FinishGoalVC.swift
//  GoalPost-app
//
//  Created by Ziyad almohisen on 30/04/2019.
//  Copyright © 2019 Ziyad almohisen. All rights reserved.
//

import UIKit
import CoreData



class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    //Outlets
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    
    var goalDescripation: String!
    var goalType: GoalType!
    
    func initData(descripation: String, type: GoalType) {
        self.goalDescripation = descripation
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKetboard()
        pointsTextField.delegate = self
        
    }
    
    @IBAction func createGoalPressed(_ sender: Any) {
        if pointsTextField.text != "" {
        self.save { (complete) in
            if complete {
                dismiss(animated: true, completion: nil)
            }
        }
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let mangedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: mangedContext)
        
        goal.goalDescription = goalDescripation
        goal.goalType = goalType.rawValue
        goal.goalcompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try mangedContext.save()
            print("Success")
            completion(true)
        } catch {
            debugPrint("Could Not Save: \(error.localizedDescription)")
            completion(false)
        }
        
       
    }
    
}
