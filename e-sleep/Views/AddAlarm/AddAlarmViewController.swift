//
//  AddAlarmViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/20.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Alertift

final class AddAlarmViewController: UIViewController {
    
    private var cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
    private var saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    
    private var datePicker = UIDatePicker()
    
    private let disposeBag = DisposeBag()
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: AddAlarmViewController())
    }
    
    private lazy var viewModel = AddAlarmViewModel(
        saveButtonTapped: self.saveButton.rx.tap.asObservable()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        cancelButton.rx.tap
            .subscribe { _ in
                self.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        datePicker.rx.value
            .bind(to: viewModel.dateRelay)
            .disposed(by: disposeBag)
        
//        viewModel.dismissHandler
//            .bind(to: dismissMe)
//            .disposed(by: disposeBag)
    }
    
    private func configure() {
        view.backgroundColor = .white
            
        navigationItem.title = "Add Alarm"
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = saveButton
        
        view.addSubview(datePicker)
        datePickerConfigure()
    }
    
    private func datePickerConfigure() {
        datePicker.datePickerMode = .time
        datePicker.minuteInterval = 10
        
        datePicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(datePicker.snp.width).multipliedBy(0.6)
        }
    }
}

extension AddAlarmViewController {
    private var dismissMe: Binder<Void> {
        return Binder(self) { me, _ in
            me.dismiss(animated: true, completion: nil)
        }
    }
    
    private var showErrorAlert: Binder<String> {
        return Binder(self) { me, message in
            Alertift
                .alert(title: "エラー", message: message)
                .action(.default("OK"))
                .show()
        }
    }
}
