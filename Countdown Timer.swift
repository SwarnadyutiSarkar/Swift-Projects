import UIKit

class CountdownTimerViewController: UIViewController {
    // Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // Variables
    var timer: Timer?
    var secondsRemaining: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "01:00"
        stopButton.isEnabled = false
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        timer?.invalidate()
        secondsRemaining = 60
        updateTimeLabel()
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
            updateTimeLabel()
        } else {
            stopTimer(stopButton)
        }
    }
    
    func updateTimeLabel() {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
