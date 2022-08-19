
import Foundation
import UIKit

// Presenter -> Coordinator
protocol UserPetsCoordinatorProtocol {
    func openPetBreedDetails(using pet: UserPet)
}

// Presenter -> ViewController
protocol UserPetsViewProtocol: AnyObject {
    func reload()
    func removePet(at indexPath: IndexPath)
    func seeBreed(at indexPath: IndexPath)
}

// ViewController -> Presenter
protocol UserPetsPresenterProtocol: UICollectionViewDataSource {
    func viewWillAppear()
    func removePet(at indexPath: IndexPath)
    func seeBreed(at indexPath: IndexPath)
}

// Presenter -> Repository
protocol UserPetsInputProtocol {
    func getUserPets()
    func remove(name: String)
}

// Repository -> Presenter
protocol UserPetsOutputProtocol: AnyObject {
    func getUserPetsSuccess(with pets: [UserPet])
    func removeSuccess(with pets: [UserPet])
}
