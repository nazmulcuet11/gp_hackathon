//
//  AppDelegate.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit
import CocoaLumberjack

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let fileLogger: DDFileLogger = DDFileLogger()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    private func setupLogger() {
        fileLogger.maximumFileSize = 1024 * 1024 * 50
        fileLogger.rollingFrequency = 60 * 60 * 24
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        fileLogger.logFormatter = LogFormatter()
        DDLog.add(fileLogger)

        // xcode console
        if let consoleLogger = DDTTYLogger.sharedInstance {
            consoleLogger.logFormatter = LogFormatter()
            DDLog.add(consoleLogger)
        }
    }
}

