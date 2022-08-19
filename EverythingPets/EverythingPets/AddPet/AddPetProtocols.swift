
import Foundation
import UIKit

// Presenter -> Coordinator
protocol AddPetCoordinatorProtocol {
    func openUserPets()
}

// Presenter -> ViewController
protocol AddPetViewProtocol: AnyObject {
    func showAlert(title: String, message: String)
}

// ViewController -> Presenter
protocol AddPetPresenterProtocol {
    func submitPet(name: String?, image: UIImage?, imageName: String)
}
