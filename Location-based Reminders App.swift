import Foundation
import CoreLocation

class LocationReminder {
    let locationManager = CLLocationManager()
    
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func addReminder(location: CLLocation, message: String) {
        // Implement logic to add a reminder at the specified location
        print("Reminder added at location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        print("Message: \(message)")
    }
}

// Example usage
let locationReminder = LocationReminder()
locationReminder.requestLocationAuthorization()
let reminderLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
locationReminder.addReminder(location: reminderLocation, message: "Buy groceries")
