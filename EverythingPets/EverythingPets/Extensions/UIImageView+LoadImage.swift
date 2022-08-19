
import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(
            with: url,
            options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
            into: self
        )
    }
    
    func loadSavedImage(from imageName: String?) {
        guard imageName != nil else {
            image = UIImage(systemName: "photo")
            return
        }
        
        let imageUrl = documentsUrl.appendingPathComponent(imageName!)
        
        Nuke.loadImage(
            with: imageUrl,
            options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
            into: self
        )
    }
}


