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

    var configurations: [CellConfigurationType]

    init(configurations: [CellConfigurationType]) {
        self.configurations = configurations
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
        for configuration in configurations {
            tableView.registerClass(configuration.cellClass, forCellReuseIdentifier: configuration.reuseIdentifier)
        }
    }
}

extension ConfigurableTableViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configurations.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let configuration = configurations[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(configuration.reuseIdentifier, forIndexPath: indexPath)
        configuration.updateCell(cell)
        return cell
    }
}
