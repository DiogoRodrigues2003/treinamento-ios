
import Foundation
import UIKit

// Presenter -> Coordinator
protocol PetBreedsCoordinatorProtocol {
    func openPetDetails(using breed: PetBreed)
}

// Presenter -> ViewController
protocol PetBreedsViewProtocol: AnyObject {
    func reload()
    func firstPage()
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

// ViewController -> Presenter
protocol PetBreedsPresenterProtocol: UICollectionViewDataSource {
    func viewDidLoad()
    func nextPage()
    func previousPage()
    func openPetDetails(index: Int)
}

// Presenter -> Repository
protocol PetBreedsInputProtocol: AnyObject {
    var output: PetBreedsOutputProtocol? { get set }
    func getPetBreeds(page: Int)
}

// Repository -> Presenter
protocol PetBreedsOutputProtocol: AnyObject {
    func getPetBreedsSuccess(with breeds: [PetBreed])
    func getPetBreedsFailure(with error: APIError)
}
