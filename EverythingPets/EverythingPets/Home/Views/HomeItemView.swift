
import Foundation
import UIKit

protocol HomeItemViewDelegateProtocol {
    func touched(type: PetType)
}

class HomeItemView: UIView {
    
    private let type: PetType
    
    var delegate: HomeItemViewDelegateProtocol?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var petTypeNameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = Colors.base()
        view.layer.shadowColor = Colors.darkerBase2()?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        return view
    }()
    
    lazy var petLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    init(type: PetType) {
        self.type = type
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = Colors.lighterBase()
        imageView.image = type.homeImage
        petLabel.text = type.homeTitle
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "white")?.cgColor
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
    }
    
    @objc func touched() {
        delegate?.touched(type: type)
    }
    
    func buildViews() {
        addSubview(imageView)
        addSubview(petTypeNameView)
        
        petTypeNameView.addSubview(petLabel)
    }
    
    func buildConstraints() {
    
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
            make.width.equalTo(150)
            make.height.equalTo(170)
        }
        
        petTypeNameView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        petLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
