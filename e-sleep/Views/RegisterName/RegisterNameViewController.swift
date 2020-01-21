//
//  RegisterNameViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RegisterNameViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    @IBOutlet private weak var validationLabel: UILabel!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private lazy var viewModel: RegisterNameViewModel = RegisterNameViewModel(
        nameText: self.nameTextField.rx.text.asObservable(),
        nextButtonTapped: self.nextButton.rx.tap.asObservable()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        viewModel.validationText
            .bind(to: validationLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.canRegister
            .bind(to: nextButton.rx.isEnabled)
            .disposed(by: disposeBag)
    
        nextButton.rx.tap
            .subscribe { _ in
                let storyboard: UIStoryboard = UIStoryboard(name: "RegisterIcon", bundle: nil)
                guard let registerIconViewController = storyboard.instantiateViewController(withIdentifier: "RegisterIcon") as? RegisterIconViewController else {
                    return
                }
                self.navigationController?.pushViewController(registerIconViewController, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func configure() {
        navigationItem.title = "SignUp"
        
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 5
    }
}
