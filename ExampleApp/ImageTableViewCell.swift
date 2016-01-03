//
//  ImageTableViewCell.swift
//  ConfigurableTableViewController
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()

        // we should use a custom imageView, but this will do for demonstrational purposes
        imageView?.frame = bounds
        imageView?.contentMode = .ScaleAspectFit

        resetSeparators()
    }

    func updateWithViewData(viewData: ImageCellViewData) {
        imageView?.image = viewData.image
    }
}

extension ImageTableViewCell: Updatable {
    typealias ViewData = ImageCellViewData
}
