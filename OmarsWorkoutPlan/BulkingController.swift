//
//  BulkingController.swift
//  OmarsWorkoutPlan
//
//  Created by Omar A on 2/29/24.
//

import UIKit
import AVFoundation



class BulkingController: UIViewController {

    
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
        let br0 = Routine()
        br0.Days = "Day 1"
        br0.Workout1 = "Flat Bench Press 3x10"
        br0.Workout2 = "Incline Bench Press 3x10"
        br0.Workout3 = "Fly's 3x10"
        br0.Workout4 = "Triceps kick back 3x10"
        br0.Workout5 = "Skull Crushers 3x10"
        RoutinesArray.insert(br0, at: 0)
        
        let br1 = Routine()
        br1.Days = "Day 2"
        br1.Workout1 = "Squat 3x10"
        br1.Workout2 = "Leg Press 3x10"
        br1.Workout3 = "Lunges 3x10"
        br1.Workout4 = "Natural Glute Ham Raise 3x10"
        br1.Workout5 = "Shoulder press (superset) Rear Delt 3x10(each)"
        RoutinesArray.append(br1)
        
        let br2 = Routine()
        br2.Days = "Day 3"
        br2.Workout1 = "Deadlift 3x10"
        br2.Workout2 = "Barbell Rows 3x10"
        br2.Workout3 = "Shrugs 3x10"
        br2.Workout4 = "Bicep Curl 3x10"
        br2.Workout5 = "Hammer Curl 3x10"
        RoutinesArray.append(br2)
        
        let br3 = Routine()
        br3.Days = "Day 4"
        br3.Workout1 = "Flat Dumbbell Press 3x10"
        br3.Workout2 = "Incline Dumbbell Press 3x10"
        br3.Workout3 = "Incline Fly’s 3x10"
        br3.Workout4 = "Tringale Push Ups 3x10"
        RoutinesArray.append(br3)
        
        let br4 = Routine()
        br4.Days = "Day 5"
        br4.Workout1 = "Squat 3x10"
        br4.Workout2 = "Hack Squat 3x10"
        br4.Workout3 = "Stair Climber for 10 minutes"
        br4.Workout4 = "Arnold Shoulder press 3x10"
        br4.Workout5 = "Incline dumbbell reverse fly 3x10"
        RoutinesArray.append(br4)
        
        let br5 = Routine()
        br5.Days = "Day 6"
        br5.Workout1 = "Dumbbell Deadlift 3x10"
        br5.Workout2 = "Dumbbell Rows 3x10"
        br5.Workout3 = "Dumbbell Shrugs 3x10"
        br5.Workout4 = "Barbell Bicep Curl 3x10"
        RoutinesArray.append(br5)
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



