//
//  TextTableViewCell.swift
//  ConfigurableTableViewController
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    func updateWithViewData(viewData: TextCellViewData) {
        textLabel?.text = viewData.title
        backgroundColor = UIColor(white: 0.93, alpha: 1)
    }
}
