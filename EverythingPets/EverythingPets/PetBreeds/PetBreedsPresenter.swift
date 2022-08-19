
import Foundation
import UIKit

class PetBreedsPresenter: NSObject {

    weak var view: PetBreedsViewProtocol?
    var repository: PetBreedsInputProtocol
    var coordinator: PetBreedsCoordinatorProtocol
    
    private var breeds: [PetBreed] = []
    
    var page = 0
    
    init(repository: PetBreedsInputProtocol,
                  coordinator: PetBreedsCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PetBreedsPresenter: PetBreedsPresenterProtocol {
    
    func openPetDetails(index: Int) {
        let breed = breeds[index]
        coordinator.openPetDetails(using: breed)
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        repository.getPetBreeds(page: page)
    }
    
    func nextPage() {
        page += 1
        viewDidLoad()
    }
    
    func previousPage() {
        guard page > 0 else {
            return
        }
        page -= 1
        
        if page == 0 {
            self.view?.firstPage()
        }
        viewDidLoad()
    }
}

// MARK: - Repository Output
extension PetBreedsPresenter: PetBreedsOutputProtocol {
    
    func getPetBreedsSuccess(with breeds: [PetBreed]) {
        
        guard !breeds.isEmpty else {
            page = 0
            self.view?.firstPage()
            repository.getPetBreeds(page: page)
            return
        }
        
        self.breeds = breeds
        
        DispatchQueue.main.async {
            self.view?.reload()
            self.view?.hideLoadingIndicator()
        }
    }
    
    func getPetBreedsFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Error", message: "A error on the API has ocurred")
        }
    }
}

extension PetBreedsPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetBreedViewCell.reuseIdentifier, for: indexPath)!
        
        cell.setup(with: breeds[indexPath.item])
        
        return cell
    }
}
