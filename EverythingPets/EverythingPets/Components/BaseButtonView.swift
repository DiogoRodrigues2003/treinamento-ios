
import Foundation
import UIKit

class BaseButtonView: UIView {
    
    var height: Int
    var width: Int

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    init(text: String, height: Int, width: Int) {
        self.height = height
        self.width = width
        
        super.init(frame: .zero)
        
        textLabel.text = text
        
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = Colors.base()
        layer.cornerRadius = 5
        layer.shadowColor = Colors.darkerBase2()?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
    }
    
    
    func buildViews() {
        addSubview(textLabel)
    }
    
    func buildConstraints() {
        
        snp.makeConstraints { make in
            make.height.equalTo(self.height)
            make.width.equalTo(self.width)
        }
    
        textLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
