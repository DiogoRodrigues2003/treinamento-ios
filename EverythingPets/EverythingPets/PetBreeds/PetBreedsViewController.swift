
import Foundation
import UIKit

class PetBreedsViewController: UIViewController, LoadingIndicatorViewType {
   
    var loadingIndicatorViewController: UIViewController?
    
    var petType: PetType
    
    private let presenter: PetBreedsPresenterProtocol
    
    lazy var paginationView: PaginationView = {
        let view = PaginationView()
        view.delegate = self
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = Colors.lighterBase()
        return collectionView
    }()
    
    init(presenter: PetBreedsPresenterProtocol, petType: PetType) {
        self.presenter = presenter
        self.petType = petType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
        configureNavigationBar()
    }
    
    private func configViews() {
        title = petType.name
        
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(PetBreedViewCell.self, forCellWithReuseIdentifier: PetBreedViewCell.reuseIdentifier.identifier)
    }
    
    private func buildViews() {
        view.addSubview(paginationView)
        view.addSubview(collectionView)
    }
    
    private func buildConstraints() {
        
        paginationView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(collectionView.snp.top)
        }
        collectionView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension PetBreedsViewController: PetBreedsViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func firstPage() {
        paginationView.firstPage()
    }
}

extension PetBreedsViewController: PaginationViewDelegateProtocol {

    func nextPage() {
        presenter.nextPage()
    }
    
    func previousPage() {
        presenter.previousPage()
    }
}

extension PetBreedsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CollectionViewLayoutConstants.cellSize(basedOn: collectionView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: CollectionViewLayoutConstants.verticalSpacing,
            left: CollectionViewLayoutConstants.horizontalSpacing,
            bottom: CollectionViewLayoutConstants.verticalSpacing,
            right: CollectionViewLayoutConstants.horizontalSpacing
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.horizontalSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewLayoutConstants.verticalSpacing
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.openPetDetails(index: indexPath.item)
    }
}
