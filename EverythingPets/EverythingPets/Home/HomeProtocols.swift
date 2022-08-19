
import Foundation

// Presenter -> Coordinator
protocol HomeCoordinatorProtocol {
    func openDogBreeds()
    func openCatBreeds()
}

// ViewController -> Presenter
protocol HomePresenterProtocol {
    func dogsTouched()
    func catsTouched()
}
