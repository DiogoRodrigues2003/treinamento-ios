
import Foundation
import UIKit

var documentsUrl: URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
}

func saveImage(name: String, image: UIImage, imageName: String) -> String? {
    let imageName = name + "-" + imageName
    let imageURL = documentsUrl.appendingPathComponent(imageName)
    
    if let imageData = image.jpegData(compressionQuality: 1.0) {
       try? imageData.write(to: imageURL, options: .atomic)
       return imageName
    }
    return nil
}

func deleteImage(name: String) {
    let imageName = name
    let imageURL = documentsUrl.appendingPathComponent(imageName)

    try? FileManager.default.removeItem(at: imageURL)
}
