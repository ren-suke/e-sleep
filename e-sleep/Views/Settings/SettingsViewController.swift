//
//  SettingsViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/20.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SettingsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var profileButton: UIButton!
    @IBOutlet private weak var thamaButton: UIButton!
    @IBOutlet private weak var aboutButton: UIButton!
    @IBOutlet private weak var usageButton: UIButton!

    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.rx.tap
            .subscribe { _ in
                self.present(EditProfileViewController.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        thamaButton.rx.tap
            .subscribe { _ in
                self.present(ChangeThemaViewController.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        aboutButton.rx.tap
            .subscribe { _ in
                self.present(AboutEsleepViewController.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        usageButton.rx.tap
            .subscribe { _ in
                self.present(UsageEsleepViewController.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
}
