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
import Alertift

final class AddAlarmViewController: UIViewController {
    
    @IBOutlet private weak var cancelButton: UIBarButtonItem!
    @IBOutlet private weak var saveButton: UIBarButtonItem!
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    static func make() -> UINavigationController {
        return UINavigationController(rootViewController: AddAlarmViewController())
    }
    
    private lazy var viewModel: AddAlarmViewModel = AddAlarmViewModel(
        saveButtonTapped: self.saveButton.rx.tap.asObservable()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                .show(on: me, completion: nil)
        }
    }
}
