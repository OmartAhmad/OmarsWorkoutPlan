

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var mySoundFile = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSound()
    }


    @IBAction func PlansButton(_ sender: Any) {
        playSound()
    }
    
    func setupSound() {
        guard let soundUrl = Bundle.main.url(forResource: "medieval_fanfare", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            mySoundFile = try AVAudioPlayer(contentsOf: soundUrl)
            mySoundFile.prepareToPlay()
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }
    
    func playSound() {
           mySoundFile.play()
       }
    
}

