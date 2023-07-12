//
//  ContentView.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 10/07/2023.
//

import SwiftUI
import NavigationBackport

struct RootView: View {
    @State var navigation = NBNavigationPath()

    var body: some View {
        NBNavigationStack(path: $navigation) {
            VStack {
                List {
                    Section("Navigation BackPort Github") {
                        Text("https://github.com/johnpatrickmorgan/NavigationBackport")
                            .multilineTextAlignment(.center)
                    }

                    Section("Navigation") {
                        Button {
                            navigation.append(Destination.seriesList)
                        } label: {
                            Text("Series List")
                        }
                        Button {
                            navigation.append(Destination.settings)
                        } label: {
                            Text("Settings")
                        }
                    }
                }
                .navigationTitle("Root View")
                .nbNavigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .seriesList:
                        SeriesListView()
                    case .serieDetail(let serie):
                        SerieDetailView(serie: serie)
                    case .messageDelivery(let message):
                        MessageDeliveryView(message: message)
                    case .settings:
                        SettingsView()
                    }
                }
//                .onAppear {
//                    AppState.shared.path = navigation
//                }
            }
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
