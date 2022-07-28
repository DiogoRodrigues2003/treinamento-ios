//
//  UIImageView+LoadImage.swift
//  Nospresso
//
//  Created by Locação on 27/07/22.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImage(using urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(with: url, options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")), into: self)
    }
}
