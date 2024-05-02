import Foundation

class TaskTimer {
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
            print("Elapsed Time: \(self.elapsedTime) seconds")
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        print("Timer stopped. Elapsed Time: \(elapsedTime) seconds")
    }
}

// Example usage
let taskTimer = TaskTimer()
taskTimer.startTimer() // Start the timer
DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    taskTimer.stopTimer() // Stop the timer after 10 seconds
}
