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

    var items: [CellConfigurationType]

    init(items: [CellConfigurationType]) {
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
        for cellConfiguration in items {
            tableView.registerClass(cellConfiguration.cellClass, forCellReuseIdentifier: cellConfiguration.reuseIdentifier)
        }
    }
}

extension ConfigurableTableViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellConfiguration = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellConfiguration.reuseIdentifier, forIndexPath: indexPath)
        cellConfiguration.updateCell(cell)
        return cell
    }
}
