
import Foundation
import UIKit

class UserPetsPresenter: NSObject {
    
    weak var view: UserPetsViewProtocol?
    var repository: UserPetsInputProtocol
    var coordinator: UserPetsCoordinatorProtocol
    
    private var pets: [UserPet] = []
    
    init(repository: UserPetsInputProtocol,
        coordinator: UserPetsCoordinatorProtocol
    ) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension UserPetsPresenter: UserPetsPresenterProtocol {
    
    func seeBreed(at indexPath: IndexPath) {
        coordinator.openPetBreedDetails(using: pets[indexPath.item])
    }
    
    func removePet(at indexPath: IndexPath) {
        UserPets.shared.remove(name: pets[indexPath.item].name)
        viewWillAppear()
    }
    

    func viewWillAppear() {
        repository.getUserPets()
    }
}

// MARK: - Repository Output
extension UserPetsPresenter: UserPetsOutputProtocol {
    
    func getUserPetsSuccess(with pets: [UserPet]) {
        self.pets = pets
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    
    func removeSuccess(with pets: [UserPet]) {
        self.pets = pets
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
}

extension UserPetsPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserPetViewCell.reuseIdentifier, for: indexPath)!
        
        cell.setup(with: pets[indexPath.item], indexPath: indexPath)
        cell.delegate = view
        
        return cell
    }
}
