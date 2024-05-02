import Foundation

struct Photo {
    let name: String
    let imageURL: URL
}

class PhotoGalleryApp {
    var photos: [Photo] = []
    
    func addPhoto(name: String, imageURL: URL) {
        let photo = Photo(name: name, imageURL: imageURL)
        photos.append(photo)
        print("Photo added: \(photo.name)")
    }
    
    func displayPhotos() {
        print("Photos in gallery:")
        for photo in photos {
            print(photo.name)
        }
    }
}

// Example usage
let photoGalleryApp = PhotoGalleryApp()
photoGalleryApp.addPhoto(name: "Photo 1", imageURL: URL(string: "https://example.com/photo1.jpg")!)
photoGalleryApp.addPhoto(name: "Photo 2", imageURL: URL(string: "https://example.com/photo2.jpg")!)
photoGalleryApp.displayPhotos()
