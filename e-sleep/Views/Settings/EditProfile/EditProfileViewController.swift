//
//  EditAcountViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/12.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class EditProfileViewController: UIViewController {
    
    private let cancelButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    private let saveButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    
    private let disposeBag: DisposeBag = DisposeBag()
    private lazy var viewModel: EditProfileViewModel = EditProfileViewModel(
        nameTextChanged: self.nameTextField.rx.text.asObservable(),
        cancelButtonTapped: self.cancelButton.rx.tap.asObservable(),
        saveButtonTapped: self.saveButton.rx.tap.asObservable()
    )
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: TabBarController())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        navigationItem.title = "アカウントを編集"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
    }
}
