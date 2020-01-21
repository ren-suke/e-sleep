//
//  ExperienceOperator.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

protocol ExperienceRealmOperatorProtocol {
    /// 経験値テーブルの初期構成
    /// - Parameter experienceTable:
    func configure(with experienceTable: [Experience]) -> Void
    /// 経験値テーブルの取得
    func get() -> [Experience]
}

final class ExperienceRealmOperator: ExperienceRealmOperatorProtocol {
    func configure(with experienceTable: [Experience]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(experienceTable)
            }
        } catch {
            print(error)
        }
    }
    
    func get() -> [Experience] {
        var experienceTable: [Experience] = []
        do {
            let realm = try Realm()
            _ = realm.objects(Experience.self).map { experienceTable.append($0) }
        } catch {
            print(error)
        }
        return experienceTable
    }
}
