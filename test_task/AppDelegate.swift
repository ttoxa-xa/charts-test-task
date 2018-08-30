//
//  AppDelegate.swift
//  test_task
//
//  Created by Anton on 29.08.2018.
//  Copyright © 2018 iOS Brotherhood. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let service = TickerService()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        service.tickers().subscribe(onNext: { ticker in
            print(ticker)
        })
        return true
    }
}

