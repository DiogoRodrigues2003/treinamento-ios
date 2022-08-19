
import Foundation
import UIKit

class UserPetsViewController: UIViewController {
   
    private let presenter: UserPetsPresenterProtocol
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Colors.lighterBase()
        return collectionView
    }()
    
    init(presenter: UserPetsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
        configureNavigationBar()
        presenter.viewWillAppear()
    }
    
    private func configViews() {
        title = Localizable.userPetsTitle()
        
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(UserPetViewCell.self, forCellWithReuseIdentifier: UserPetViewCell.reuseIdentifier.identifier)
        
        removeBackButtonLabel()
    }
    
    private func buildViews() {
        view.addSubview(collectionView)
    }
    
    private func buildConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension UserPetsViewController: UserPetsViewProtocol {
    
    func seeBreed(at indexPath: IndexPath) {
        presenter.seeBreed(at: indexPath)
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func removePet(at indexPath: IndexPath) {
        presenter.removePet(at: indexPath)
    }
}

extension UserPetsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CollectionViewLayoutConstants.userPetsCellSize(basedOn: collectionView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: CollectionViewLayoutConstants.verticalSpacing,
            left: CollectionViewLayoutConstants.horizontalSpacing,
            bottom: CollectionViewLayoutConstants.verticalSpacing,
            right: CollectionViewLayoutConstants.horizontalSpacing
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.verticalSpacing
    }
}
