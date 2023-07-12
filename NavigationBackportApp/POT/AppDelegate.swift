//
//  AppDelegate.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 11/07/2023.
//

import UIKit

/// Prepare the app to receive a push notification
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, ObservableObject {

    private var appStateParser: AppStateParser = .init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        UIApplication.shared.registerForRemoteNotifications()

        let center = UNUserNotificationCenter.current()
        center.delegate = self

        center.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
        }

        return true
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        let userInfo = notification.request.content.userInfo
        appStateParser.parse(userInfo)
    }
}

