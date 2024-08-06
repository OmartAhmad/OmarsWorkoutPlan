//
//  MaintainController.swift
//  OmarsWorkoutPlan
//
//  Created by Omar A on 3/8/24.
//

import Foundation
import UIKit
import AVFoundation

class MaintianController: UIViewController {
    
    
    @IBOutlet weak var Workout1: UILabel!
    
    @IBOutlet weak var Workout2: UILabel!
    
    @IBOutlet weak var Workout3: UILabel!
    
    @IBOutlet weak var Workout4: UILabel!
    
    @IBOutlet weak var Workout5: UILabel!
    
    @IBOutlet weak var Days: UILabel!
    
    @IBOutlet weak var DaySlider: UISegmentedControl!
    
    @IBAction func DaySliderListener(_ sender: Any) {
        setWorkouts(DaySlider)
        playSound()
    }
    
    
    var RoutinesArray = [Routine]()
    var mySoundFile: AVAudioPlayer?
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercises()
        setWorkouts(DaySlider)
        setupSound()
        setupBackButton()
    }
    
    func setupSound() {
          guard let soundUrl = Bundle.main.url(forResource: "next_page", withExtension: "wav") else {
              print("Sound file not found")
              return
          }

          do {
              mySoundFile = try AVAudioPlayer(contentsOf: soundUrl)
              mySoundFile?.prepareToPlay()
          } catch {
              print("Error loading sound file: \(error.localizedDescription)")
          }
      }
    
    func playSound() {
            mySoundFile?.play()
        }
    
    
    func exercises(){
        let mr0 = Routine()
        mr0.Days = "Day 1"
        mr0.Workout1 = "Flat Bench Press 3x15 1xTo Failure"
        mr0.Workout2 = "Dumbbell Flat Chest Press 3x15"
        mr0.Workout3 = "Fly's 3x15"
        mr0.Workout4 = "Triceps Dips 3x15"
        mr0.Workout5 = "Biceps Curls 3x15"
        RoutinesArray.insert(mr0, at: 0)
        
        let mr1 = Routine()
        mr1.Days = "Day 2"
        mr1.Workout1 = "Squat 1xTo Failure"
        mr1.Workout2 = "Leg Press 3x15"
        mr1.Workout3 = "Hack Squat 3x15"
        mr1.Workout4 = "Shoulder press 3x15"
        mr1.Workout5 = "Dumbbell Lateral Raise (superset) Rear Delt 3x15"
        RoutinesArray.append(mr1)
        
        let mr2 = Routine()
        mr2.Days = "Day 3"
        mr2.Workout1 = "Deadlift 3x15 1xTo Failure"
        mr2.Workout2 = "Barbell Rows 3x15"
        mr2.Workout3 = "Bicep Curl 3x15 1xTo Failure"
        mr2.Workout4 = "Hammer Curl 3x15"
        RoutinesArray.append(mr2)
        
        let mr3 = Routine()
        mr3.Days = "Day 4"
        mr3.Workout1 = "Incline Bench Press 3x15"
        mr3.Workout2 = "Incline Dumbbell Press 3x15"
        mr3.Workout3 = "Incline Fly’s 3x15"
        mr3.Workout4 = "Skull Crusher 3x15 1xTo Failure"
        RoutinesArray.append(mr3)
        
        let mr4 = Routine()
        mr4.Days = "Day 5"
        mr4.Workout1 = "Quad Extension 3x15"
        mr4.Workout2 = "Hamstring Extension 3x15"
        mr4.Workout3 = "Calves 3x15"
        mr4.Workout4 = "Arnold Shoulder press 3x15 1xTo Failure"
        mr4.Workout5 = "Incline dumbbell reverse fly 3x15 1xTo Failure"
        RoutinesArray.append(mr4)
        
        let mr5 = Routine()
        mr5.Days = "Day 6"
        mr5.Workout1 = "Shrugs 3x15"
        mr5.Workout2 = "Pull Ups 3x15"
        mr5.Workout3 = "Dumbbell Deadlifts 3x15"
        mr5.Workout4 = "Concentration biceps curl 3x15"
        RoutinesArray.append(mr5)
    }
    
    @IBAction func btnSite(_ sender: Any) {
        if let url = URL(string: "https://www.bodybuilding.com/exercises/finder") {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
    }
    
    func setWorkouts(_ sender: UISegmentedControl){
        
        let index = DaySlider.selectedSegmentIndex
        
        Days.text = RoutinesArray[index].Days
        Workout1.text = RoutinesArray[index].Workout1
        Workout2.text = RoutinesArray[index].Workout2
        Workout3.text = RoutinesArray[index].Workout3
        Workout4.text = RoutinesArray[index].Workout4
        Workout5.text = RoutinesArray[index].Workout5
        
        
    }
    
    func setupBackButton() {
            backButton = UIButton(type: .system)
            backButton.setTitle("Back", for: .normal)
            backButton.setTitleColor(.white, for: .normal)
            backButton.backgroundColor = .blue
            backButton.layer.cornerRadius = 5
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

            // Add the button to the view and bring it to front
            view.addSubview(backButton)
            view.bringSubviewToFront(backButton)

            // Set the button constraints
            backButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                backButton.widthAnchor.constraint(equalToConstant: 60),
                backButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        }

        @objc func backButtonTapped() {
            // Handle back button action
            self.dismiss(animated: true, completion: nil)
        }
    
    
}
