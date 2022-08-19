
import Foundation
import UIKit

class PetBreedDetailsViewController: UIViewController, LoadingIndicatorViewType {
   
    var loadingIndicatorViewController: UIViewController?
    
    var petType: PetType
    
    private let presenter: PetBreedDetailsPresenterProtocol
    
    lazy var detailsView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var breedNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = Colors.darkerBase2()
        return label
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
    
    lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var newImageButtonView: BaseButtonView = {
        let view = BaseButtonView(text: Localizable.buttonNewImage(), height: 40, width: 130)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newImage)))
        return view
    }()
    
    lazy var hasPetButtonView: BaseButtonView = {
        let view = BaseButtonView(text: Localizable.buttonHasPet(), height: 40, width: 130)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addPet)))
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var infosStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    lazy var firstInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: petType.firstInfo)
        return view
    }()
    
    lazy var secondInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: petType.secondInfo)
        return view
    }()
    
    lazy var lifeSpanInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: Localizable.lifeSpan())
        return view
    }()
    
    lazy var temperamentInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: Localizable.temperament())
        return view
    }()
    
    lazy var fifthInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: petType.fifthInfo)
        return view
    }()
    
    lazy var weightInfoView: PetInfoItemView = {
        let view = PetInfoItemView(infoType: Localizable.weight())
        return view
    }()
   
    init(presenter: PetBreedDetailsPresenterProtocol, petType: PetType) {
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

        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    private func configViews() {
        title = Localizable.breedDetails()
        view.backgroundColor = Colors.lighterBase()
    }
    
    @objc func newImage() {
        presenter.getNewPetImage()
    }
    
    @objc func addPet() {
        presenter.addPet()
    }
    
    private func buildViews() {
        view.addSubview(detailsView)
        
        buttonsView.addSubview(newImageButtonView)
        buttonsView.addSubview(hasPetButtonView)
        
        detailsView.addSubview(breedNameLabel)
        detailsView.addSubview(breedImageView)
        detailsView.addSubview(buttonsView)
        detailsView.addSubview(scrollView)
        
        scrollView.addSubview(infosStackView)
        
        infosStackView.addArrangedSubview(firstInfoView)
        infosStackView.addArrangedSubview(secondInfoView)
        infosStackView.addArrangedSubview(lifeSpanInfoView)
        infosStackView.addArrangedSubview(temperamentInfoView)
        infosStackView.addArrangedSubview(fifthInfoView)
        infosStackView.addArrangedSubview(weightInfoView)
    }
    
    private func buildConstraints() {
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        breedNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        breedImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(breedNameLabel.snp.bottom).offset(10)
            make.width.equalTo(350)
            make.height.equalTo(200)
        }
        
        buttonsView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(breedImageView.snp.bottom).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        newImageButtonView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        hasPetButtonView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonsView.snp.bottom).offset(10)
            make.width.equalTo(350)
            make.height.equalTo(300)
        }
        
        infosStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(10)
            make.width.equalTo(310)
        }
    }
}

extension PetBreedDetailsViewController: PetBreedDetailsViewProtocol {
    
    func setupDog(with details: DogBreedDetails) {
        breedNameLabel.text = details.name
        
        firstInfoView.infoLabel.text = unknownInfoChecker(info: details.bredFor)
        secondInfoView.infoLabel.text = unknownInfoChecker(info: details.breedGroup)
        lifeSpanInfoView.infoLabel.text = unknownInfoChecker(info: details.lifeSpan)
        temperamentInfoView.infoLabel.text = unknownInfoChecker(info: details.temperament)
        fifthInfoView.infoLabel.text = details.height.value + Localizable.centimeter()
        weightInfoView.infoLabel.text = details.weight.value + Localizable.kilo()
    }
    
    func setupCat(with details: CatBreedDetails) {
        breedNameLabel.text = details.name

        firstInfoView.infoLabel.text = infoFormatter(info: details.natural)
        secondInfoView.infoLabel.text = infoFormatter(info: details.hairless)
        lifeSpanInfoView.infoLabel.text = catLifeSpanFormatter(lifeSpan: details.lifeSpan)
        temperamentInfoView.infoLabel.text = unknownInfoChecker(info: details.temperament)
        fifthInfoView.infoLabel.text = infoFormatter(info: details.lap)
        weightInfoView.infoLabel.text = details.weight.value + Localizable.kilo()
    }
    
    func setupImage(image: PetImage) {
        if image.url != nil {
            breedImageView.loadImage(from: (image.url)!)
        } else {
            breedImageView.image = UIImage(systemName: "photo")
        }
    }
}
