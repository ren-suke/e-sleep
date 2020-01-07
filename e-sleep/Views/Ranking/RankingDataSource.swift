//
//  RankingTableViewDataSource.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RankingDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [RankingDetailData]
    private var items: Element = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[RankingDetailData]>) {
        Binder<Element>(self) { dataSource, items in
            dataSource.items = items
            tableView.reloadData()
        }.on(observedEvent)
    }
}
