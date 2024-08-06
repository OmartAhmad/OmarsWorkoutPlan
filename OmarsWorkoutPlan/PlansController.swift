//
//  PlansController.swift
//  OmarsWorkoutPlan
//
//  Created by Omar A on 2/28/24.
//

import Foundation
import UIKit

class PlansController: UIViewController {
    
    var SplitViewHT: Routine = Routine()
        var selectedPlanType: String?
    
    @IBOutlet weak var PlanName: UILabel!
    
    
    @IBOutlet weak var DescriptionTitle: UILabel!
    
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var bulkingButton: UIButton!
        @IBOutlet weak var cuttingButton: UIButton!
        @IBOutlet weak var maintainingButton: UIButton!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Set the plan choice based on the selected plan type
            setupButtons()
            setChoice(index: 0)
        }

        func setupButtons() {
            // Hide all buttons initially
            bulkingButton.isHidden = true
            cuttingButton.isHidden = true
            maintainingButton.isHidden = true
            
            // Show the button based on the selected plan type
            switch selectedPlanType {
            case "bulking":
                bulkingButton.isHidden = false
            case "cutting":
                cuttingButton.isHidden = false
            case "maintaining":
                maintainingButton.isHidden = false
            default:
                break
            }
        }
        
        func setChoice(index: Int) {
            let selectedPlan = SplitViewHT
            PlanName.text = selectedPlan.PlanName
            DescriptionTitle.text = selectedPlan.DescriptionTitle
            Description.text = selectedPlan.Description
        }
    
    @IBAction func viewBulkingPlan(_ sender: Any) {
        
    }
    
    
    @IBAction func veiwCuttingPlan(_ sender: Any) {
    }
    
    
    @IBAction func veiwMaintainingPlan(_ sender: Any) {
    }
    
  
    
}
