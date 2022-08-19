
import Foundation
import UIKit

class PetInfoItemView: UIView {
    
    lazy var infoTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.numberOfLines = 2
        label.textAlignment = .right
        return label
    }()
    
    init(infoType: String) {
        super.init(frame: .zero)

        infoTypeLabel.text = infoType
        
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViews() {
        addSubview(infoTypeLabel)
        addSubview(infoLabel)
    }
    
    func buildConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        infoTypeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        infoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalTo(infoTypeLabel.snp.trailing)
        }
    }
}
