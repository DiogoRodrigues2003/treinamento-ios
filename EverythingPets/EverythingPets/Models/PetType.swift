
import Foundation
import UIKit

enum PetType: Codable {
    case dog
    case cat
    
    var homeTitle: String {
        switch self {
        case .dog:
            return Localizable.dogsCaps()
        case .cat:
            return Localizable.catsCaps()
        }
    }
    
    var homeImage: UIImage? {
        switch self {
        case .dog:
            return Images.homeDog()
        case .cat:
            return Images.homeCat()
        }
    }

    var name: String {
        switch self {
        case .dog:
            return Localizable.dogs()

        case .cat:
            return Localizable.cats()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .dog:
            return Images.dogIcon()

        case .cat:
            return Images.catIcon()
        }
    }
    
    var firstInfo: String {
        switch self {
        case .dog:
            return Localizable.bredFor()

        case .cat:
            return Localizable.natural()
        }
    }
        
    var secondInfo: String {
        switch self {
        case .dog:
            return Localizable.bredGroup()

        case .cat:
            return Localizable.hairless()
        }
    }
            
    var fifthInfo: String {
        switch self {
        case .dog:
            return Localizable.height()

        case .cat:
            return Localizable.lap()
        }
    }
}
