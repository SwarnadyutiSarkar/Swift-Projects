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

class RecipeViewController: UIViewController {
    // Example recipes
    let recipes: [Recipe] = [
        Recipe(title: "Pasta Carbonara", ingredients: ["Spaghetti", "Eggs", "Bacon", "Parmesan Cheese"], instructions: "Cook spaghetti. Fry bacon. Mix eggs with cheese. Combine everything."),
        Recipe(title: "Caesar Salad", ingredients: ["Lettuce", "Croutons", "Chicken", "Caesar Dressing"], instructions: "Mix lettuce with croutons and cooked chicken. Add dressing.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load recipes and display them
    }
}
