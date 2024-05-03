import UIKit

class MeditationViewController: UIViewController {
    // Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // Variables
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:00:00"
        stopButton.isEnabled = false
    }
    
    @IBAction func startMeditation(_ sender: UIButton) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopMeditation(_ sender: UIButton) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        timer?.invalidate()
        elapsedTime = 0
        updateTimer()
    }
    
    @objc func updateTimer() {
        elapsedTime += 1
        let seconds = Int(elapsedTime) % 60
        let minutes = Int(elapsedTime) / 60 % 60
        let hours = Int(elapsedTime) / 3600
        timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
