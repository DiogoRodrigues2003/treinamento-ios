
import Foundation
import UIKit

protocol PaginationViewDelegateProtocol {
    func nextPage()
    func previousPage()
}

class PaginationView: UIView {
    
    var delegate: PaginationViewDelegateProtocol?

    lazy var nextPageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        view.tintColor = Colors.darkerBase()
        view.addTarget(self, action: #selector(nextPage), for: .touchDown)
        return view
    }()
    
    lazy var previousPageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        view.tintColor = Colors.darkerBase()
        view.addTarget(self, action: #selector(previousPage), for: .touchDown)
        view.isHidden = true
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = Colors.base()
    }
    
    @objc func nextPage() {
        previousPageButton.isHidden = false
        delegate?.nextPage()
    }
    
    @objc func previousPage() {
        delegate?.previousPage()
    }
    
    func buildViews() {
        addSubview(nextPageButton)
        addSubview(previousPageButton)
    }
    
    func buildConstraints() {
    
        snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        nextPageButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(40)
        }
        
        previousPageButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(40)
        }
    }
}

extension PaginationView {
    
    func firstPage() {
        DispatchQueue.main.async {
            self.previousPageButton.isHidden = true
        }
    }
}

