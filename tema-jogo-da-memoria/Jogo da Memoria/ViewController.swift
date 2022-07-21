//
//  ViewController.swift
//  Jogo da Memoria
//
//  Created by Locação on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var restartStackView: UIStackView = {
        let restart = UIStackView()
        restart.axis = .horizontal
        restart.alignment = .center
        restart.spacing = 10
        return restart
    }()
    
    lazy var restartLabel: UILabel = {
        let label = UILabel()
        label.text = "Reiniciar"
        label.font = label.font.withSize(33)
        return label
    }()
    
    lazy var restartImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "restart-icon")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        buildViews()
        buildConstrainst()
    }
    
    @objc func buttonResetClick() {
        
    }


}

// MARK: - views setup

extension ViewController {
    
    func configViews(){
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(restartStackView)
        restartStackView.addArrangedSubview(restartLabel)
        restartStackView.addArrangedSubview(restartImageView)
        
        
//        view.addSubview(reiniciarButton)
//        view.addSubview(forcaImageView)
//        view.addSubview(bonecoImageView)
//        view.addSubview(textosStackView)
//
//        textosStackView.addArrangedSubview(dicaLabel)
//        textosStackView.addArrangedSubview(palpiteLabel)
//        textosStackView.addArrangedSubview(letraTextField)
//        textosStackView.addArrangedSubview(chutesAnterioresTituloLabel)
//        textosStackView.addArrangedSubview(chutesAnterioresLabel)
    }
    
    func buildConstrainst() {
        restartStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
            
        }
//        reiniciarButton.snp.makeConstraints{ make in
//            //            make.right.equalToSuperview().inset(25)
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
//            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
//        }
//        forcaImageView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
//        }
//
//        bonecoImageView.snp.makeConstraints { make in
//            make.trailing.equalTo(forcaImageView).inset(10)
//            make.top.equalTo(forcaImageView.snp.centerY).offset(-15)
//        }
//
//        textosStackView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(forcaImageView.snp.bottom).offset(24)
//        }
//
//        letraTextField.snp.makeConstraints { make in
//            //            make.width.height.equalTo(40)
//            make.size.equalTo(40)
//        }
    }
}

