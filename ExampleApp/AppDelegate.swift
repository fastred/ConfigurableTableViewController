//
//  AppDelegate.swift
//  ExampleApp
//
//  Created by Arkadiusz Holko on 03-01-16.
//  Copyright © 2016 Arkadiusz Holko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let viewController = ConfigurableTableViewController(items: [
            CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Foo")),
            CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Apple")!)),
            CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Google")!)),
            CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Bar")),
            ])

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
