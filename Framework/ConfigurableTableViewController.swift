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

    var items: [SectionConfigurator]

    init(items: [SectionConfigurator]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        view.addSubview(tableView)
        self.tableView = tableView

        tableView.dataSource = self
        registerCells()
    }

    func registerCells() {
        for sectionConfigurator in items {
            for cellConfigurator in sectionConfigurator.cellConfigurators {
                tableView.registerClass(cellConfigurator.cellClass, forCellReuseIdentifier: cellConfigurator.reuseIdentifier)
            }
        }
    }
}

extension ConfigurableTableViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].cellConfigurators.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let sectionConfigurator = items[indexPath.section]
        let cellConfigurator = sectionConfigurator.cellConfigurators[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellConfigurator.reuseIdentifier, forIndexPath: indexPath)
        cellConfigurator.updateCell(cell)
        return cell
    }
}
