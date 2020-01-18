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
import TransitionButton
import Alertift
import SnapKit

final class RegisterIconViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var imageViewContainer = UIView()
    private var iconImageView: UIImageView = UIImageView(image: Images.addPhoto)
    
    private var startButton: TransitionButton = TransitionButton()
    
    var name: String?
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private lazy var viewModel: RegisterIconViewModel = RegisterIconViewModel(
        startButtonTapped: self.startButton.rx.tap.asObservable(),
        nameText: self.name
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        viewModel.uploadStatus
            .bind(to: indicatorAnimate)
            .disposed(by: disposeBag)

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
        
        startButton.rx.tap.subscribe { _ in
            let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }
        .disposed(by: disposeBag)
    }
    
    private func configure() {
        view.addSubview(startButton)
        view.addSubview(imageViewContainer)
        
        startButtonConfigure()
        imageViewContainerConfigure()
    }
    
    private func startButtonConfigure() {
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(startButton.snp.width).multipliedBy(0.3)
        }
        
        startButton.backgroundColor = Colors.main
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.textColor = .white
        startButton.cornerRadius = view.frame.width * 0.06
        startButton.clipsToBounds = true
    }
    
    private func imageViewContainerConfigure() {
        imageViewContainer.addSubview(iconImageView)
        iconImageViewConfigure()
        
        imageViewContainer.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(startButton.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func iconImageViewConfigure() {
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(startButton)
            make.height.equalTo(startButton.snp.width)
        }
        
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = view.frame.width * 0.2
        iconImageView.layer.borderWidth = 1
        iconImageView.layer.borderColor = Colors.main.cgColor
        iconImageView.contentMode = .scaleAspectFit
    }
}

extension RegisterIconViewController {
    private var indicatorAnimate: Binder<UploadStatus> {
        return Binder(self) { me, uploadStatus in
            switch uploadStatus {
            case .isUploading:
                me.startButton.startAnimation()
            case .isNotUploading:
                me.startButton.stopAnimation()
            case .isFailed:
                me.startButton.stopAnimation(animationStyle: .shake, revertAfterDelay: 1, completion: nil)
            case .isSuccess:
                me.startButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1, completion: {
                    let tabBarControllerStoryboard = UIStoryboard(name: "TabBarController", bundle: nil)
                    guard let tabBarController = tabBarControllerStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
                    tabBarController.modalPresentationStyle = .fullScreen
                    me.present(tabBarController, animated: true, completion: nil)
                })
            }
        }
    }
    
    private var showErrorAlert: Binder<String> {
        return Binder(self) { me, errorMessage in
            Alertift
                .alert(title: "エラー", message: errorMessage)
                .action(.default("OK"))
                .show()
        }
    }
}

extension RegisterIconViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePicker(_ sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        iconImageView.image = image
        
//        viewModel.iconImageData = image.jpegData(compressionQuality: 0.5)
    }
}
