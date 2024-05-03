import UIKit

class FitnessActivity {
    let activityType: String
    let duration: TimeInterval
    let date: Date
    
    init(activityType: String, duration: TimeInterval, date: Date) {
        self.activityType = activityType
        self.duration = duration
        self.date = date
    }
}

class FitnessTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var fitnessActivities: [FitnessActivity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Load fitness activities
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fitnessActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        let activity = fitnessActivities[indexPath.row]
        cell.textLabel?.text = "\(activity.activityType) - \(activity.duration) min"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        cell.detailTextLabel?.text = dateFormatter.string(from: activity.date)
        return cell
    }
}
