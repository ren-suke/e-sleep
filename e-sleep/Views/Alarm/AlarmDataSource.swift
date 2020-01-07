//
//  AlarmDataSource.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

final class AlarmDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [Alarm]
    private var items: Element = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as? AlarmTableViewCell else { return UITableViewCell() }
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[Alarm]>) {
        Binder<Element>(self) { dataSource, items in
            dataSource.items = items
            tableView.reloadData()
        }.on(observedEvent)
    }
}
