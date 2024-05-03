import UIKit

class Recipe {
    let title: String
    let ingredients: [String]
    let instructions: String
    
    init(title: String, ingredients: [String], instructions: String) {
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let recipes: [Recipe] = [
        Recipe(title: "Pasta Carbonara", ingredients: ["Spaghetti", "Eggs", "Bacon", "Parmesan Cheese"], instructions: "Cook spaghetti. Fry bacon. Mix eggs with cheese. Combine everything."),
        Recipe(title: "Caesar Salad", ingredients: ["Lettuce", "Croutons", "Chicken", "Caesar Dressing"], instructions: "Mix lettuce with croutons and cooked chicken. Add dressing.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.title
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRecipe = recipes[indexPath.row]
        // Display selected recipe details
    }
}
