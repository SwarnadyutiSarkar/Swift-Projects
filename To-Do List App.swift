import UIKit

class TodoItem {
    var title: String
    var completed: Bool
    
    init(title: String) {
        self.title = title
        self.completed = false
    }
}

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var todoItems: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let todoItem = todoItems[indexPath.row]
        cell.textLabel?.text = todoItem.title
        cell.accessoryType = todoItem.completed ? .checkmark : .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        todoItems[indexPath.row].completed.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: - IBActions
    
    @IBAction func addItemButtonTapped(_ sender: UIButton) {
        guard let title = textField.text, !title.isEmpty else { return }
        let newItem = TodoItem(title: title)
        todoItems.append(newItem)
        tableView.reloadData()
        textField.text = ""
    }
}
