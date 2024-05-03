import Foundation

class PomodoroTimer {
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    var workDuration: TimeInterval = 25 * 60 // 25 minutes
    var breakDuration: TimeInterval = 5 * 60 // 5 minutes
    
    var isWorking: Bool = true
    
    func startPomodoro() {
        print("Starting Pomodoro...")
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
            print("Elapsed Time: \(self.elapsedTime) seconds")
            if self.elapsedTime >= (self.isWorking ? self.workDuration : self.breakDuration) {
                self.switchTimerMode()
            }
        }
    }
    
    func stopPomodoro() {
        timer?.invalidate()
        timer = nil
        print("Pomodoro completed.")
    }
    
    func switchTimerMode() {
        isWorking = !isWorking
        print("Switching to \(isWorking ? "Work" : "Break") mode.")
        elapsedTime = 0
    }
}

// Example usage
let pomodoroTimer = PomodoroTimer()
pomodoroTimer.startPomodoro() // Start Pomodoro timer
