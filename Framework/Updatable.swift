//
//  Updatable.swift
//  ConfigurableTableViewController
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import Foundation

protocol Updatable: class {

    associatedtype ViewData

    func update(viewData: ViewData)
}
