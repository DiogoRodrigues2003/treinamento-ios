
import Foundation
import UIKit

// Presenter -> Coordinator
protocol PetBreedDetailsCoordinatorProtocol {
    func openPetRegistration(breedName: String, breedId: String, petType: PetType)
}

// Presenter -> ViewController
protocol PetBreedDetailsViewProtocol: AnyObject {
    func setupDog(with details: DogBreedDetails)
    func setupCat(with details: CatBreedDetails)
    func setupImage(image: PetImage)
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

// ViewController -> Presenter
protocol PetBreedDetailsPresenterProtocol {
    func viewDidLoad()
    func getNewPetImage()
    func addPet()
}

// Presenter -> Repository
protocol PetBreedDetailsInputProtocol: AnyObject  {
    var output: PetBreedDetailsOutputProtocol? { get set }
    func getPetBreedDetails(name: String)
    func getNewPetImage(id: String)
}

// Repository -> Presenter
protocol PetBreedDetailsOutputProtocol: AnyObject {
    func getDogBreedDetailsSuccess(with details: DogBreedDetails)
    func getCatBreedDetailsSuccess(with details: CatBreedDetails)
    func getPetBreedDetailsFailure(with error: APIError)
    func getNewPetImageSuccess(with image: PetImage)
    func getNewPetImageFailure(with error: APIError)
}
