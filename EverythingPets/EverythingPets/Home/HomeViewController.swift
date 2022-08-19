
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let presenter: HomePresenterProtocol
    
    lazy var homeHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.base()
        return view
    }()
    
    lazy var homeHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = Localizable.homeTitle()
        label.textColor = Colors.darkerBase2()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var dogsView: HomeItemView = {
        let view = HomeItemView(type: .dog)
        view.delegate = self
        return view
    }()

    lazy var catsView: HomeItemView = {
        let view = HomeItemView(type: .cat)
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configViews()
        buildViews()
        buildConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configViews() {
        removeBackButtonLabel()
    }

    private func buildViews() {
        view.addSubview(homeHeaderView)
        view.addSubview(stackView)

        homeHeaderView.addSubview(homeHeaderLabel)
        stackView.addArrangedSubview(dogsView)
        stackView.addArrangedSubview(catsView)

    }

    private func buildConstraints() {
        
        homeHeaderView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top)
        }
        
        homeHeaderLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(homeHeaderView.snp.bottom)
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        dogsView.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        catsView.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
    }
}

extension HomeViewController: HomeItemViewDelegateProtocol {

    func touched(type: PetType) {
        switch type {
        case .dog:
            presenter.dogsTouched()
        case .cat:
            presenter.catsTouched()
        }
    }
}

