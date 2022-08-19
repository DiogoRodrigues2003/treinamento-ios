
import Foundation

import XCTest
@testable import EverythingPets

class PetBreedsPresenterTests: XCTestCase {
    
    let petExample: PetBreed = PetBreed(id: "1", name: "Yorkshire Terrier", image: nil, type: .dog)
    
    //SPY
    var testsSpy = PetBreedsPresenterSpy()
    
    //SYSTEM UNDER TEST
    var sut: PetBreedsPresenter?
    
    override func setUp() {
        sut = .init(repository: testsSpy, coordinator: testsSpy)
        sut?.view = testsSpy
    }
    
    func test_openPetDetails_shouldCallOpenPetDetails_fromCoordinator() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.getPetBreedsSuccess(with: [petExample])
        
        // When
        sut.openPetDetails(index: 0)
        
        // Then
        XCTAssertEqual(testsSpy.didCallOpenPetDetails, true)
    }
    
    func test_viewDidLoad_shouldCallShowLoadingIndicator_andGetPetBreeds() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(testsSpy.didCallShowLoading, true)
        XCTAssertEqual(testsSpy.didCallGetPetBreeds, true)
    }
    
    func test_nextPage_shouldAddAPage_andCallViewDidLoad_thatCallsGetPetBreeds() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        
        // When
        sut.nextPage()
        
        // Then
        XCTAssertEqual(sut.page, 1)
        XCTAssertEqual(testsSpy.didCallGetPetBreeds, true)
    }
    
    func test_previousPage_shouldDecreaseAPage_givenPageIsGreaterThanZero_andCallViewDidLoad_thatCallsGetPetBreeds() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.page = 2
        
        // When
        sut.previousPage()
        
        // Then
        XCTAssertEqual(sut.page, 1)
        XCTAssertEqual(testsSpy.didCallGetPetBreeds, true)
    }
    
    func test_previousPage_shouldDoNothing_givenPageIsNotGreaterThanZero() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        
        // When
        sut.previousPage()
        
        // Then
        XCTAssertEqual(sut.page, 0)
    }
    
    func test_previousPage_shouldCallFirstPage_givenDecreasedPageIsZero() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.page = 1
        
        // When
        sut.previousPage()
        
        // Then
        XCTAssertEqual(testsSpy.didCallFirstPage, true)
    }
    
//    func test_getPetBreedsSuccess_shouldCallReload_andHideLoadingIndicator_givenBreedListIsNotEmpty() throws {
//        // Given
//        let sut = try XCTUnwrap(sut)
//
//        // When
//        sut.getPetBreedsSuccess(with: [petExample])
//
//        // Then
//        XCTAssertEqual(testsSpy.didCallReload, true)
//        XCTAssertEqual(testsSpy.didCallHideLoading, true)
//    }
    
    func test_getPetBreedsSuccess_shouldMakePageZero_andCallFirstPage_andGetPetBreeds_givenBreedListIsEmpty() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.page = 1
        
        // When
        sut.getPetBreedsSuccess(with: [])
        
        // Then
        XCTAssertEqual(sut.page, 0)
        XCTAssertEqual(testsSpy.didCallFirstPage, true)
        XCTAssertEqual(testsSpy.didCallGetPetBreeds, true)
    }
}

class PetBreedsPresenterSpy: PetBreedsViewProtocol, PetBreedsInputProtocol, PetBreedsCoordinatorProtocol {
    
    var output: PetBreedsOutputProtocol?
    
    var didCallReload = false
    var didCallFirstPage = false
    var didCallShowAlert = false
    var didCallShowLoading = false
    var didCallHideLoading = false
    var didCallGetPetBreeds = false
    var didCallOpenPetDetails = false
    
    func reload() {
        didCallReload = true
    }
    
    func firstPage() {
        didCallFirstPage = true
    }
    
    func showAlert(title: String, message: String) {
        didCallShowAlert = true
    }
    
    func showLoadingIndicator() {
        didCallShowLoading = true
    }
    
    func hideLoadingIndicator() {
        didCallHideLoading = true
    }
    
    func getPetBreeds(page: Int) {
        didCallGetPetBreeds = true
    }
    
    func openPetDetails(using breed: PetBreed) {
        didCallOpenPetDetails = true
    }
}
