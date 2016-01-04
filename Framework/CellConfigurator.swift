//
//  CellConfigurator.swift
//  ConfigurableTableViewController
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

protocol CellConfiguratorType {

    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }

    func updateCell(cell: UITableViewCell)
}

struct CellConfigurator<Cell where Cell: Updatable, Cell: UITableViewCell> {

    let viewData: Cell.ViewData
    let reuseIdentifier: String = NSStringFromClass(Cell)
    let cellClass: AnyClass = Cell.self

    func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateWithViewData(viewData)
        }
    }
}

extension CellConfigurator: CellConfiguratorType {
}
