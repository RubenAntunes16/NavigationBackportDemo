//
//  Page2.swift
//  NavigationBackportApp
//
//  Created by Rúben Antunes on 10/07/2023.
//

import SwiftUI
import NavigationBackport

struct SeriesListView: View {

    @EnvironmentObject var viewModel: SeriesListViewModel
    @EnvironmentObject var navigation: PathNavigator

    var body: some View {
        Self._printChanges()
        return VStack {
            List {
                Section("Series Available") {
                    if viewModel.series.count > 0 {
                        ForEach(viewModel.series) { serie in
                            HStack {
                                Text(serie.title)
                                Spacer()
                                Text(serie.year)
                            }
                            .onTapGesture {
                                navigation.path.append(Destination.serieDetail(serie: serie))
                            }
                        }
                    } else {
                        Text("No series available.")
                    }
                }

                Section("Navigation") {
                    Button {
                        navigation.pop()
                    } label: {
                        Text("Return to Root View")
                    }
                }
            }
        }
        .navigationTitle("Series List")
    }
}

struct Page2View_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SeriesListView()
    }
}
