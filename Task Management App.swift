import UIKit

class Task {
    let title: String
    var isCompleted: Bool
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
}

class TaskManagementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Example array to store tasks
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load existing tasks from storage
    }
    
    func saveTasksToStorage() {
        // Save tasks array to storage (e.g., UserDefaults or CoreData)
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }
    
    // UITableViewDelegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        task.isCompleted = !task.isCompleted
        tableView.reloadRows(at: [indexPath], with: .automatic)
        // Save tasks to storage
        saveTasksToStorage()
    }
    
    @IBAction func addTaskButtonPressed(_ sender: UIButton) {
        // Display UI for adding a new task
        // Add the new task to the tasks array
        let newTask = Task(title: "New Task")
        tasks.append(newTask)
        // Save tasks to storage
        saveTasksToStorage()
    }
}
