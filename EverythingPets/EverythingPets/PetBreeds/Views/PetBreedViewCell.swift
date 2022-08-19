
import Foundation
import UIKit
import Rswift

class PetBreedViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<PetBreedViewCell> = ReuseIdentifier(identifier: "pet-cell")
    
    lazy var breedNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.textColor = .gray
        return label
    }()
    
    lazy var petTypeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var breedImageView: UIImageView = {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                   
    func setup(with breed: PetBreed) {
        petTypeImageView.image = breed.type.icon
        breedNameLabel.text = breed.name
        
        if breed.image?.url != nil {
            breedImageView.loadImage(from: (breed.image?.url)!)
        } else {
            breedImageView.image = UIImage(systemName: "photo")
        }
    }
    
    private func configViews() {
        backgroundColor = .white
        layer.cornerRadius = 15
    }
    
    private func buildViews() {
        contentView.addSubview(petTypeImageView)
        contentView.addSubview(breedImageView)
        contentView.addSubview(breedNameLabel)
    }
    
    private func buildConstraints() {
        
        petTypeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.trailing.equalTo(breedImageView.snp.trailing)
            make.size.equalTo(25)
        }
        
        breedImageView.snp.makeConstraints { make in
            make.top.equalTo(petTypeImageView.snp.bottom).offset(10)
            make.center.equalToSuperview()
            make.width.equalTo(150)
        }
        
        breedNameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(7)
            make.leading.equalTo(breedImageView.snp.leading)
            make.trailing.equalTo(breedImageView.snp.trailing)
            make.top.equalTo(breedImageView.snp.bottom)
        }
    }
}
