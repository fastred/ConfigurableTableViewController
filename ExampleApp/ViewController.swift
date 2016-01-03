//
//  ViewController.swift
//  ExampleApp
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

enum TableViewItem {
    case Text(viewData: TextCellViewData)
    case Image(viewData: ImageCellViewData)
}

private let appleConfiguration = ImageCellViewData(image: UIImage(named: "Apple")!)
private let googleConfiguration = ImageCellViewData(image: UIImage(named: "Google")!)

private let textCellIdentifier = NSStringFromClass(TextTableViewCell)
private let imageCellIdentifier = NSStringFromClass(ImageTableViewCell)

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var items: [TableViewItem] = [
        .Text(viewData: TextCellViewData(title: "Foo")),
        .Image(viewData: ImageCellViewData(image: UIImage(named: "Apple")!)),
        .Image(viewData: ImageCellViewData(image: UIImage(named: "Google")!)),
        .Text(viewData: TextCellViewData(title: "Bar")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        registerCells()
    }

    func registerCells() {
        for item in items {
            let cellClass: AnyClass
            let identifier: String

            switch(item) {
            case .Text(viewData: _):
                cellClass = TextTableViewCell.self
                identifier = textCellIdentifier
            case .Image(viewData: _):
                cellClass = ImageTableViewCell.self
                identifier = imageCellIdentifier
            }
            tableView.registerClass(cellClass, forCellReuseIdentifier: identifier)
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]

        switch(item) {
        case let .Text(viewData: viewData):
            let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier) as! TextTableViewCell
            cell.updateWithViewData(viewData)
            return cell
        case let .Image(viewData: viewData):
            let cell = tableView.dequeueReusableCellWithIdentifier(imageCellIdentifier) as! ImageTableViewCell
            cell.updateWithViewData(viewData)
            return cell
        }

    }

}
