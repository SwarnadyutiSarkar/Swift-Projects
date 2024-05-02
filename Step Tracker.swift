import Foundation
import CoreMotion

class StepTracker {
    private let pedometer = CMPedometer()
    
    func startTrackingSteps() {
        guard CMPedometer.isStepCountingAvailable() else {
            print("Step counting is not available on this device.")
            return
        }
        
        pedometer.startUpdates(from: Date()) { (pedometerData, error) in
            guard let pedometerData = pedometerData, error == nil else {
                print("Error fetching step data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let numberOfSteps = pedometerData.numberOfSteps {
                print("Number of steps: \(numberOfSteps)")
            }
        }
    }
    
    func stopTrackingSteps() {
        pedometer.stopUpdates()
    }
}

// Example usage
let stepTracker = StepTracker()
stepTracker.startTrackingSteps()
