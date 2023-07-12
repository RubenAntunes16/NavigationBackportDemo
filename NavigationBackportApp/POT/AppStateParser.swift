//
//  AppStateParser.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 11/07/2023.
//

import Foundation

/// Used to decode the data received from the notification
struct AppStateParser {

    @MainActor func parse(_ userInfo: [AnyHashable: Any]) {
        if let series = parse(userInfo["series"], into: [Serie].self) {
            AppState.shared.series.update(series)
        }

        if let destinationResponse = parse(userInfo["destinations"], into: DestinationResponse.self) {
            AppState.shared.path?.path = destinationResponse.destinations
        }
    }

    private func parse<T: Codable>(_ node: Any?, into type: T.Type) -> T? {
        guard let node = node else {
            return nil
        }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: node)
            let decoded = try JSONDecoder().decode(type, from: jsonData)
            return decoded
        }
        catch {
            print(error)
            return nil
        }
    }
}

struct DestinationResponse: Codable {
    let destinations: [Destination]
}
