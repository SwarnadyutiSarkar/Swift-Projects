import Foundation

class EBookReader {
    func openBook(bookTitle: String) {
        print("Opening book: \(bookTitle)")
    }
    
    func readPage(pageNumber: Int) {
        print("Reading page \(pageNumber)...")
    }
    
    func closeBook() {
        print("Closing book.")
    }
}

// Example usage
let ebookReader = EBookReader()
ebookReader.openBook(bookTitle: "The Great Gatsby")
ebookReader.readPage(pageNumber: 1)
ebookReader.readPage(pageNumber: 2)
ebookReader.closeBook()
