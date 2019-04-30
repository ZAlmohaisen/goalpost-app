//
//  ViewController.swift
//  GoalPost-app
//
//  Created by Ziyad almohisen on 30/04/2019.
//  Copyright © 2019 Ziyad almohisen. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate


class GoalsVC: UIViewController {
    

    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
        
    }

    @IBAction func addGoalBtnPressed(_ sender: Any) {
        guard let CreateGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(CreateGoalVC)
    }
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
//        cell.configureCell(description: "Eat salad twice a week", Type: "short term", goalProgressAmount: 2)
        cell.configureCell(description: "Eat salad twice a week", Type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
    
    
    
    
    
}
