//
//  RegisterIconViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Alertift

final class RegisterIconViewController: UIViewController {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    
    @IBOutlet private weak var startButton: UIButton!
    var name: String?
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private lazy var viewModel: RegisterIconViewModel = RegisterIconViewModel(
        startButtonTapped: self.startButton.rx.tap.asObservable(),
        nameText: self.name
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()

        iconImageView.rx.tapGesture()
            .subscribe { _ in
                Alertift
                    .actionSheet()
                    .action(.default("Camera"))
                    .action(.default("PhotoLibrary"))
                    .action(.cancel("Cancel"))
                    .show()
            }
            .disposed(by: disposeBag)
        
        startButton.rx.tap
            .subscribe { _ in
                self.present(TabBarController(), animated: true, completion: nil)
            }
        .disposed(by: disposeBag)
    }
    
    private func configure() {
        
    }
}

extension RegisterIconViewController {
    
    private var showErrorAlert: Binder<String> {
        return Binder(self) { me, errorMessage in
            Alertift
                .alert(title: "エラー", message: errorMessage)
                .action(.default("OK"))
                .show(on: me, completion: nil)
        }
    }
}

extension RegisterIconViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePicker(_ sourceType: UIImagePickerController.SourceType) {
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        
        iconImageView.image = image
        
//        viewModel.iconImageData = image.jpegData(compressionQuality: 0.5)
    }
}
