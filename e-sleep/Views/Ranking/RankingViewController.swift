//
//  RankingViewController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/20.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RankingViewController: UIViewController {
    
    private var levelBar: LevelBar!
    
    @IBOutlet private weak var rankingLabel: UILabel!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var refreshControl = UIRefreshControl()
    
    private let disposeBag = DisposeBag()
    
    private lazy var viewModel = RankingViewModel(
        with: RankingViewModelInputs(
            segmentedControl: self.segmentedControl.rx.value.asObservable(),
            refreshControl: self.refreshControl.rx.controlEvent(.valueChanged).asObservable()
        )
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelBar = LevelBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        view.addSubview(levelBar)
    }
    
    func configureTableView() {
        tableView.refreshControl = refreshControl
    }
}
