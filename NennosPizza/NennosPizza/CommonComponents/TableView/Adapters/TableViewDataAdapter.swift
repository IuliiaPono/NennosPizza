//
//  TableViewDataAdapter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

open class TableViewDataAdapter<T>: NSObject, UITableViewDataSource {
    
    public typealias DataProvider = (TableViewDataAdapter<T>, IndexPath) -> AnyCellViewModel
    
    open var data: [T] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private let dataProvider: DataProvider
    
    private weak var tableView: UITableView?
    
    public init(tableView: UITableView, dataProvider: @escaping DataProvider) {
        self.tableView = tableView
        self.dataProvider = dataProvider
        super.init()
        tableView.dataSource = self
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withModel: itemModel(at: indexPath), for: indexPath)
    }
    
    open func itemModel(at indexPath: IndexPath) -> AnyCellViewModel {
        return dataProvider(self, indexPath)
    }
}

extension TableViewDataAdapter where T == AnyCellViewModel {
    
    public convenience init(tableView: UITableView) {
        self.init(tableView: tableView) { dataSource, indexPath in
            dataSource.data[indexPath.row]
        }
    }
}

extension TableViewDataAdapter where T: AnyCellViewModel {
    
    public convenience init(tableView: UITableView) {
        self.init(tableView: tableView) { dataSource, indexPath in
            dataSource.data[indexPath.row]
        }
    }
}
