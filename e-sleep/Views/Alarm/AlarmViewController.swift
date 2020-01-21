//
//  AlarmsViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/20.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class AlarmsViewController: UIViewController {
    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    let dataSource: AlarmDataSource = AlarmDataSource()
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private let viewModel: AlarmViewModel = AlarmViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewConfigure()
        
        addButton.rx.tap
            .subscribe { _ in
                self.present(AddAlarmViewController.make(), animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        viewModel.alarms
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func tableViewConfigure() {
        tableView.dataSource = dataSource
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "AlarmCell")
        tableView.rowHeight = 80
    }
}
