//
//  CuttingController.swift
//  OmarsWorkoutPlan
//
//  Created by Omar A on 3/7/24.
//


import UIKit
import AVFoundation

class CuttingController: UIViewController {
    
    
    @IBOutlet weak var Workout1: UILabel!
    
    @IBOutlet weak var Workout2: UILabel!
    
    @IBOutlet weak var Workout3: UILabel!
    
    @IBOutlet weak var Workout4: UILabel!
    
    @IBOutlet weak var Workout5: UILabel!
    
    @IBOutlet weak var Workout6: UILabel!
    
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
        // Do any additional setup after loading the view.
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
        let cr0 = Routine()
        cr0.Days = "Day 1"
        cr0.Workout1 = "Flat Bench Press 3x20 1xTo Failure"
        cr0.Workout2 = "Incline Bench Press 3x20"
        cr0.Workout3 = "Cable Standing Fly's 3x15"
        cr0.Workout4 = "Push Ups x100"
        cr0.Workout5 = "Flat chest press Machine 3x20"
        cr0.Workout6 = "Incline chest press Machine 3x20"
        RoutinesArray.insert(cr0, at: 0)
        
        let cr1 = Routine()
        cr1.Days = "Day 2"
        cr1.Workout1 = "Squat 3x20 1xTo Failure"
        cr1.Workout2 = "Leg Press 3x20"
        cr1.Workout3 = "Quad Extension 3x20"
        cr1.Workout4 = "Hamstring Extension 3x20"
        cr1.Workout5 = "Jump Squats 3x20"
        cr1.Workout6 = "Biking 30 mins"
        RoutinesArray.append(cr1)
        
        let cr2 = Routine()
        cr2.Days = "Day 3"
        cr2.Workout1 = "Pull ups 3x20 1xTo Failure"
        cr2.Workout2 = "Deadlifts 3x20"
        cr2.Workout3 = "Barbell Row 3x20"
        cr2.Workout4 = "Shrugs 3x20"
        cr2.Workout5 = "Tire Flips x3"
        RoutinesArray.append(cr2)
        
        let cr3 = Routine()
        cr3.Days = "Day 4"
        cr3.Workout1 = "Dumbbell Biceps Curls 3x20"
        cr3.Workout2 = "Dumbbell Hammer Curls 3x20"
        cr3.Workout3 = "Concentration Curls 3x20"
        cr3.Workout4 = "Triceps dips 3x20"
        cr3.Workout5 = "Tringle Push Ups 3x20"
        cr3.Workout6 = "Triceps kickbacks 3x20"
        RoutinesArray.append(cr3)
        
        let cr4 = Routine()
        cr4.Days = "Day 5"
        cr4.Workout1 = "Run 10 miles outdoors"
        RoutinesArray.append(cr4)
        
        let cr5 = Routine()
        cr5.Days = "Day 6"
        cr5.Workout1 = "Shadow Boxing 6 rounds"
        cr5.Workout2 = "Heavy Bag 6 rounds"
        RoutinesArray.append(cr5)
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
        Workout6.text = RoutinesArray[index].Workout6
        

        
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
