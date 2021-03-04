
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBOutlet weak var topView: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()

        progressView.progress = 0.0
        secondsPassed = 0
        topView.text = sender.currentTitle
        
        var hardness = sender.currentTitle
        
        switch hardness {
            case "Soft":
                totalTime = 5
            case "Medium":
                totalTime = 420
            case "Hard":
                totalTime = 720
            default:
                print("None")
            }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
   
    
    @objc func timerAction(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            
        } else{
            timer.invalidate()
            topView.text = "DONE!"
            playSound()
            
        }
        
    }
    
 
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "success", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }

}

