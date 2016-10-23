//
//  File.swift
//  ConfigurableTableViewController
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

class ConfigurableTableViewController: UIViewController {

    weak var tableView: UITableView!

    var items: [CellConfiguratorType]

    init(items: [CellConfiguratorType]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        view.addSubview(tableView)
        self.tableView = tableView

        tableView.dataSource = self
        registerCells()
    }

    func registerCells() {
        for cellConfigurator in items {
            tableView.register(cellConfigurator.cellClass, forCellReuseIdentifier: cellConfigurator.reuseIdentifier)
        }
    }
}

extension ConfigurableTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurator = items[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellConfigurator.reuseIdentifier, for: indexPath)
        cellConfigurator.update(cell: cell)
        return cell
    }
}
