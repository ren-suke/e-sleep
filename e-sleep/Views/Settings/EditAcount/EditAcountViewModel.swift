//
//  EditAcountViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/12.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class EditAcountViewModel {
    
    let newIconImageRelay = PublishRelay<UIImage>()
    
    var oldIconImageData: Data?
    var oldName: String?
    
    init(nameTextChanged: Observable<String?>, cancelButtonTapped: Observable<Void>, saveButtonTapped: Observable<Void>) {
        
        
    }
}
