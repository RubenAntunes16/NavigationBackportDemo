//
//  NavigationBackportAppApp.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 10/07/2023.
//

import SwiftUI
import NavigationBackport

@main
struct NavigationBackportApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject var state = AppState.shared
    @State var path = NBNavigationPath()

    var body: some Scene {
        WindowGroup {
            NBNavigationStack(path: $path) {
                RootView()
                    .environmentObject(AppState.shared.series)
            }
        }
    }
}
