
import Foundation
import UIKit
import Rswift

class UserPetViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<UserPetViewCell> = ReuseIdentifier(identifier: "pet-cell")
    
    var delegate: UserPetsViewProtocol?
    
    var indexPath: IndexPath?
    
    lazy var petNameView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: Localizable.name())
        return view
    }()
    
    lazy var breedNameView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: Localizable.breed())
        return view
    }()

    lazy var petTypeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var petImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.shadowColor = Colors.darkerBase2()?.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 3
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Colors.base()
        imageView.tintColor = Colors.darkerBase()
        return imageView
    }()
    
    lazy var removePetButtonView: BaseButtonView = {
        let view = BaseButtonView(text: Localizable.buttonRemove(), height: 30, width: 90)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removePet)))
        return view
    }()
    
    lazy var seeBreedButtonView: BaseButtonView = {
        let view = BaseButtonView(text: Localizable.buttonSeeBreed(), height: 30, width: 90)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seeBreed)))
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    func setup(with pet: UserPet, indexPath: IndexPath) {
        self.indexPath = indexPath
        
        petTypeImageView.image = pet.type.icon
        
        petNameView.infoLabel.text = pet.name
        breedNameView.infoLabel.text = pet.breedName
        
        petImageView.loadSavedImage(from: pet.imageName)
    }
    
    private func configViews() {
        backgroundColor = .white
        layer.cornerRadius = 15
    }
    
    @objc func removePet() {
        delegate?.removePet(at: indexPath!)
    }
    
    @objc func seeBreed() {
        delegate?.seeBreed(at: indexPath!)
    }
    
    private func buildViews() {
        contentView.addSubview(petTypeImageView)
        contentView.addSubview(petImageView)
        contentView.addSubview(breedNameView)
        contentView.addSubview(petNameView)
        contentView.addSubview(removePetButtonView)
        contentView.addSubview(seeBreedButtonView)
    }
    
    private func buildConstraints() {
        
        petTypeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.size.equalTo(25)
        }
        
        petImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(140)
        }
        
        petNameView.snp.makeConstraints { make in
            make.top.equalTo(petTypeImageView.snp.bottom).offset(10)
            make.trailing.equalTo(petTypeImageView.snp.trailing)
            make.leading.equalTo(petImageView.snp.trailing).offset(10)
        }
        
        breedNameView.snp.makeConstraints { make in
            make.top.equalTo(petNameView.snp.bottom).offset(10)
            make.trailing.equalTo(petNameView.snp.trailing)
            make.leading.equalTo(petNameView.snp.leading)
        }
        
        removePetButtonView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(breedNameView.snp.trailing)
        }
        
        seeBreedButtonView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(breedNameView.snp.leading)
        }
    }
}
