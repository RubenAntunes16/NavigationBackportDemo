//
//  AppState.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 11/07/2023.
//

import Foundation
import NavigationBackport

/// This will have all tje dependencies that we what to inject in the app
class AppState: ObservableObject {
    static let shared = AppState()

    /// It's access in the app by Environment Objects
    @Published var series: SeriesListViewModel = .init(series: [])
    @Published var path: PathNavigator?
}
