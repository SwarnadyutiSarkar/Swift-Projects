import UIKit

class IntervalTimerViewController: UIViewController {
    // Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    // Variables
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    var isWorkoutTime: Bool = true
    var workoutDuration: TimeInterval = 30 // Workout duration in seconds
    var restDuration: TimeInterval = 10 // Rest duration in seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "00:00"
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
        elapsedTime = 0
        updateTimer()
    }
    
    @objc func updateTimer() {
        elapsedTime += 1
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        
        if isWorkoutTime && elapsedTime >= workoutDuration {
            isWorkoutTime = false
            timerLabel.textColor = UIColor.red
            elapsedTime = 0
        } else if !isWorkoutTime && elapsedTime >= restDuration {
            isWorkoutTime = true
            timerLabel.textColor = UIColor.green
            elapsedTime = 0
        }
    }
}
