//
//  ViewController.swift
//  ExampleApp
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

private let appleConfiguration = ImageCellViewData(image: UIImage(named: "Apple")!)
private let googleConfiguration = ImageCellViewData(image: UIImage(named: "Google")!)

private let textCellIdentifier = NSStringFromClass(TextTableViewCell)
private let imageCellIdentifier = NSStringFromClass(ImageTableViewCell)

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var items: [Any] = [
        TextCellViewData(title: "Foo"),
        ImageCellViewData(image: UIImage(named: "Apple")!),
        ImageCellViewData(image: UIImage(named: "Google")!),
        TextCellViewData(title: "Bar"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        registerCells()
    }

    func registerCells() {
        tableView.registerClass(TextTableViewCell.self, forCellReuseIdentifier: textCellIdentifier)
        tableView.registerClass(ImageTableViewCell.self, forCellReuseIdentifier: imageCellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let viewData = items[indexPath.row]

        if (viewData is TextCellViewData) {
            let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier) as! TextTableViewCell
            cell.updateWithViewData(viewData as! TextCellViewData)
            return cell
        } else if (viewData is ImageCellViewData) {
            let cell = tableView.dequeueReusableCellWithIdentifier(imageCellIdentifier) as! ImageTableViewCell
            cell.updateWithViewData(viewData as! ImageCellViewData)
            return cell
        }
        
        fatalError()
    }
}
