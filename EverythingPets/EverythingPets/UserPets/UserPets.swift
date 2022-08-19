
import Foundation
import UIKit

class UserPets {
    
    static let shared = UserPets()
    
    private let userDefaults = UserDefaults.standard
    
    private let dataBaseKey = "Everything-Pets"

    var pets: [UserPet] = []
    var petsNames: [String] = []
    
    private init() {
        fetchFromDatabase()
    }
    
    func toggle(name: String, breedName: String, breedId: String, imageName: String?, type: PetType) {
        defer {
            updateDatabase()
        }
        
        let pet = UserPet(name: name, breedName: breedName, breedId: breedId, imageName: imageName, type: type)
        pets.append(pet)
        petsNames.append(pet.name)
    }
    
    func checkPet(name: String) -> Bool {
        if petsNames.contains(name) {
            return false
        } else {
            return true
        }
    }
    
    func remove(name: String) {
        defer {
            updateDatabase()
        }

        if let indexOfFoundPet = petsNames.firstIndex(of: name) {
            pets.remove(at: indexOfFoundPet)
            deleteImage(name: petsNames[indexOfFoundPet])
            petsNames.remove(at: indexOfFoundPet)
        }
    }
}

extension UserPets {
    
    func updateDatabase() {
        guard let jsonData =  try? JSONEncoder().encode(pets) else {
            return
        }
        
        userDefaults.setValue(jsonData, forKey: dataBaseKey)
    }
    
    func fetchFromDatabase() {
        guard
            let jsonData = userDefaults.data(forKey: dataBaseKey),
            let data = try? JSONDecoder().decode([UserPet].self, from: jsonData)
        else {
            return
        }
        
        self.pets = data
        data.forEach { pet in
            self.petsNames.append(pet.name)
        }
    }
}
