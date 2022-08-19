
import Foundation
import UIKit

class AddPetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AddPetViewProtocol {
    
    private let presenter: AddPetPresenterProtocol
    
    var imagePicker = UIImagePickerController()
    
    var breedName: String
    var imageName: String = ""
    
    lazy var petNameQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = Colors.darkerBase2()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var petNameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.placeholder = Localizable.textFieldExample()
        textField.tintColor = Colors.darkerBase()
        textField.backgroundColor = Colors.lighterBase2()
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    lazy var petImageQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = Colors.darkerBase2()
        label.text = Localizable.petImageQuestion()
        return label
    }()
    
    @IBOutlet lazy var choosePhotoButtonView: BaseButtonView! = {
        let view = BaseButtonView(text: Localizable.buttonPhoto(), height: 40, width: 130)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(choosePhoto)))
        return view
    }()
    
    @IBOutlet lazy var petImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.layer.shadowColor = Colors.darkerBase2()?.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 3
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var submitButtonView: BaseButtonView! = {
        let view = BaseButtonView(text: Localizable.buttonSubmit(), height: 40, width: 130)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(submitPet)))
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

        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }

    init(presenter: AddPetPresenterProtocol, breedName: String) {
        self.presenter = presenter
        self.breedName = breedName
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configViews() {
        title = Localizable.addPetTitle()
        view.backgroundColor = Colors.lighterBase()
        
        petNameQuestionLabel.text = Localizable.petNameQuestion() + breedName + "?"
    }
    
    @objc func submitPet() {
        presenter.submitPet(name: petNameTextField.text, image: petImageView.image, imageName: imageName)
    }
    
    private func buildViews() {
        view.addSubview(petNameQuestionLabel)
        view.addSubview(petNameTextField)
        view.addSubview(petImageQuestionLabel)
        view.addSubview(choosePhotoButtonView)
        view.addSubview(petImageView)
        view.addSubview(submitButtonView)
    }

    private func buildConstraints() {
        petNameQuestionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        petNameTextField.snp.makeConstraints { make in
            make.top.equalTo(petNameQuestionLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        petImageQuestionLabel.snp.makeConstraints { make in
            make.top.equalTo(petNameTextField.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        choosePhotoButtonView.snp.makeConstraints { make in
            make.top.equalTo(petImageQuestionLabel.snp.bottom).offset(15)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        petImageView.snp.makeConstraints { make in
            make.top.equalTo(choosePhotoButtonView.snp.bottom).offset(15)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(350)
            make.height.equalTo(200)
        }
        
        submitButtonView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
}

extension AddPetViewController {
    
    @IBAction func choosePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            imagePicker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            petImageView.image = image
        }
        if let imageUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            print(imageUrl.lastPathComponent)
            imageName = imageUrl.lastPathComponent
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
}



