//
//  AppDelegate.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/20.
//

import UIKit
import SwiftDate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let japan = Region(calendar: Calendars.gregorian, zone: Zones.asiaTokyo, locale: Locales.japanese)
        SwiftDate.defaultRegion = japan

        return true
    }
}
