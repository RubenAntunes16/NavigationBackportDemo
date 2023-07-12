import SwiftUI

class SeriesListViewModel: ObservableObject {
    @Published var series: [Serie]

    init(series: [Serie]) {
        self.series = series
    }
}

extension SeriesListViewModel {
    func update(_ series: [Serie]) {
        self.series = series
    }
}
