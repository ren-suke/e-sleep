//
//  LevelBar.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class LevelBar: UIView {
    
    private let imageView = UIImageView()
    
    private let statusLabel = UILabel()
    private let levelLabel = UILabel()
    private let progressLabel = UILabel()
    private let progressView = UIProgressView()
    
    private let viewModel = LevelBarViewModel()
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewModel.status
            .drive(statusLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.progress
            .drive(progressView.rx.progress)
            .disposed(by: disposeBag)
        
        backgroundColor = Color.main
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
