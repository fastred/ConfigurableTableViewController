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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let viewController = ConfigurableTableViewController(configurations: [
            CellConfiguration<TextTableViewCell>(viewData: TextCellViewData(title: "Foo")),
            CellConfiguration<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Apple")!)),
            CellConfiguration<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Google")!)),
            CellConfiguration<TextTableViewCell>(viewData: TextCellViewData(title: "Bar")),
            ])

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
