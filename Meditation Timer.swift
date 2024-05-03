import Foundation

class MeditationTimer {
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    
    func startMeditation(duration: TimeInterval) {
        print("Starting meditation for \(duration) seconds...")
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedTime += 1
            print("Elapsed Time: \(self.elapsedTime) seconds")
            if self.elapsedTime >= duration {
                self.stopMeditation()
            }
        }
    }
    
    func stopMeditation() {
        timer?.invalidate()
        timer = nil
        print("Meditation completed.")
    }
}

// Example usage
let meditationTimer = MeditationTimer()
meditationTimer.startMeditation(duration: 300) // Start a 5-minute meditation
