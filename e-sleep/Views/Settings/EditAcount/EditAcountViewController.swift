//
//  EditAcountViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/12.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class EditAcountViewController: UIViewController {
    
    private let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    private let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    
    private let iconImageViewContainer = UIView()
    private let iconImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let nameTextField = UITextField()
    
    private let disposeBag: DisposeBag = DisposeBag()
    private lazy var viewModel = EditAcountViewModel(
        nameTextChanged: self.nameTextField.rx.text.asObservable(),
        cancelButtonTapped: self.cancelButton.rx.tap.asObservable(),
        saveButtonTapped: self.saveButton.rx.tap.asObservable()
    )
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: EditAcountViewController())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        edgesForExtendedLayout = []
        navigationItem.title = "アカウントを編集"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        view.backgroundColor = .white
        view.addSubview(iconImageViewContainer)
        iconImageViewContainer.addSubview(iconImageView)
        iconImageViewConfigure()
        
        view.addSubview(userNameLabel)
        view.addSubview(nameTextField)
        nameTextFieldConfigure()
    }
    
    private func iconImageViewConfigure() {
        iconImageViewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(0.5)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(iconImageViewContainer.snp.height).multipliedBy(0.5)
            make.height.equalTo(iconImageViewContainer.snp.height).multipliedBy(0.5)
        }
        
        iconImageView.layer.cornerRadius = self.view.bounds.width * 0.125
        iconImageView.layer.borderColor = Color.main.cgColor
        iconImageView.layer.borderWidth = 2
        iconImageView.clipsToBounds = true
        iconImageView.image = R.image.addPhoto()
    }
    
    private func nameTextFieldConfigure() {
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageViewContainer.snp.bottom)
            make.trailingMargin.leadingMargin.equalToSuperview()
            make.height.equalTo(30)
        }
        
        userNameLabel.text = "user name"
        userNameLabel.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        userNameLabel.textAlignment = .center
        userNameLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel)
            make.leading.equalToSuperview().offset(20)
            make.trailingMargin.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        nameTextField.layer.borderColor = Color.main.cgColor
        nameTextField.layer.borderWidth = 2
        
    }
}
