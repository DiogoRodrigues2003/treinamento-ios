//
//  ViewController.swift
//  Forca
//
//  Created by Locação on 19/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var forcaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forca")
        return imageView
    }()
    
    lazy var bonecoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "reiniciar"), for: .normal)
        button.addTarget(self, action: #selector(buttonResetClick), for: .touchDown)
        return button
    }()
    
    lazy var textosStackView: UIStackView = {
        let textos = UIStackView()
        textos.axis = .vertical
        textos.alignment = .center
        textos.spacing = 10
        return textos
    }()
    
    lazy var dicaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var palpiteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var letraTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .namePhonePad
        textField.delegate = self
        return textField
    }()
    
    lazy var chutesAnterioresTituloLabel: UILabel = {
        let label = UILabel()
        label.text = "Chutes Anteriores"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var chutesAnterioresLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var jogoDaForca = JogoDaForca.aleatorio()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstrainst()
        
        update()
    }
    
    @objc func buttonResetClick() {
        reset()
    }
    
    
    func update() {
        palpiteLabel.attributedText = jogoDaForca.palavraMascarada.espacado
        dicaLabel.text = "A dica é: \(jogoDaForca.dica)"
        chutesAnterioresLabel.attributedText = formatarChutes()
        
        let image: UIImage?
        
        switch jogoDaForca.estadoJogo {
            case .derrota:
                image = UIImage(named: "bonecao_completo_e_mortinho")
            default:
                image = UIImage(named: "bonecao_fase_\(self.jogoDaForca.erros)")
        }
    
        UIView.transition(with: bonecoImageView, duration: 2, options: .transitionCrossDissolve, animations: {
            self.bonecoImageView.image = image
        }, completion: nil)
    }
    
    func formatarChutes() -> NSMutableAttributedString {
        jogoDaForca.tentativasAnteriores.reduce(NSMutableAttributedString()) { (partialResult, letra) in
            let letraComCor: NSMutableAttributedString = jogoDaForca.palavra.comparavel.contains(letra) ? letra.comCorDeAcerto : letra.comCorDeErro
            partialResult.append(letraComCor)
            return partialResult
        }.espacado
    }
    
    func reset() {
        jogoDaForca = .aleatorio()
        update()
    }
    
    func alert(titulo: String, descricao: String? = nil) {
        let alert = UIAlertController(title: titulo, message: descricao, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Jogar Novamente", style: .default) { _ in
            self.reset()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        letraTextField.text = string.uppercased()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let texto = textField.text {
            jogoDaForca.tentar(letra: texto)
        }
        
        switch jogoDaForca.estadoJogo {
            case .vitoria:
                alert(titulo: "Você acertou, parabéns!")
            case .derrota:
                alert(titulo: "Que pena, você errou", descricao: "Pensa um pouco mais da próxima vez")
            default: break
        }
        
        update()
        return true
    }
}

// MARK: - setup das views

extension ViewController {
    
    func configViews(){
        view.backgroundColor = UIColor(named: "fundo")
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(forcaImageView)
        view.addSubview(bonecoImageView)
        view.addSubview(textosStackView)
        
        textosStackView.addArrangedSubview(dicaLabel)
        textosStackView.addArrangedSubview(palpiteLabel)
        textosStackView.addArrangedSubview(letraTextField)
        textosStackView.addArrangedSubview(chutesAnterioresTituloLabel)
        textosStackView.addArrangedSubview(chutesAnterioresLabel)
    }
    
    func buildConstrainst() {
        reiniciarButton.snp.makeConstraints{ make in
            //            make.right.equalToSuperview().inset(25)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        forcaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        bonecoImageView.snp.makeConstraints { make in
            make.trailing.equalTo(forcaImageView).inset(10)
            make.top.equalTo(forcaImageView.snp.centerY).offset(-15)
        }
        
        textosStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forcaImageView.snp.bottom).offset(24)
        }
        
        letraTextField.snp.makeConstraints { make in
            //            make.width.height.equalTo(40)
            make.size.equalTo(40)
        }
    }
}

