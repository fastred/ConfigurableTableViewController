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

        let firstSectionConfigurator = SectionConfigurator(cellConfigurators: [
            CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Foo")),
            CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Apple")!))
        ])
        
        let secondSectionConfigurator = SectionConfigurator(cellConfigurators: [
            CellConfigurator<ImageTableViewCell>(viewData: ImageCellViewData(image: UIImage(named: "Google")!)),
            CellConfigurator<TextTableViewCell>(viewData: TextCellViewData(title: "Bar"))
        ])
        
        let viewController = ConfigurableTableViewController(items: [firstSectionConfigurator, secondSectionConfigurator])

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
