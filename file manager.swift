import UIKit

class FileManagerViewController: UIViewController {
    // Example file manager functionality
    
    // Function to list files in a directory
    func listFiles(in directory: String) -> [String] {
        do {
            let fileManager = FileManager.default
            let files = try fileManager.contentsOfDirectory(atPath: directory)
            return files
        } catch {
            print("Error listing files: \(error)")
            return []
        }
    }
    
    // Function to create a new directory
    func createDirectory(named name: String, at directory: String) {
        let newDirectory = directory + "/" + name
        do {
            try FileManager.default.createDirectory(atPath: newDirectory, withIntermediateDirectories: true, attributes: nil)
            print("Directory created: \(newDirectory)")
        } catch {
            print("Error creating directory: \(error)")
        }
    }
    
    // Function to delete a file or directory
    func deleteItem(at path: String) {
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Item deleted: \(path)")
        } catch {
            print("Error deleting item: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example usage
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        let files = listFiles(in: documentsDirectory)
        print("Files in Documents directory: \(files)")
        
        createDirectory(named: "NewDirectory", at: documentsDirectory)
        
        deleteItem(at: documentsDirectory + "/NewDirectory")
    }
}
