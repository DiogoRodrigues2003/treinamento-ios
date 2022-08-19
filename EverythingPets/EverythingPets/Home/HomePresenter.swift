
import Foundation

class HomePresenter {
    
    let coordinator: HomeCoordinatorProtocol
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func dogsTouched() {
        coordinator.openDogBreeds()
    }
    
    func catsTouched() {
        coordinator.openCatBreeds()
    }
}

