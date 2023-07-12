import SwiftUI
import NavigationBackport

struct SettingsView: View {
    var series = [
        Serie(
            title: "La Casa de Papel",
            year: "2017",
            description: "A criminal mastermind known as 'The Professor' recruits eight skilled criminals to carry out an ambitious plan to rob the Royal Mint of Spain, while using codenames based on cities. As the heist unfolds, tensions rise and unexpected events test their loyalties and intelligence.",
            actors: [
                "Álvaro Morte",
                "Úrsula Corberó",
                "Itziar Ituño",
                "Pedro Alonso"
            ]
        ),
        Serie(
            title: "Succession",
            year: "2018",
            description: "Succession follows the Roy family, a wealthy and dysfunctional media dynasty, as they battle for control of their global media and entertainment conglomerate. The series explores themes of power, family dynamics, and the dark side of wealth and privilege.",
            actors: [
                "Brian Cox",
                "Jeremy Strong",
                "Sarah Snook",
                "Kieran Culkin"
            ]
        ),
    ]
    @EnvironmentObject var navigation: PathNavigator
    
    var body: some View {
        VStack {
            List {
                Section("Other Series") {
                    ForEach(series) { serie in
                        HStack {
                            Text(serie.title)
                            Spacer()
                            Text(serie.year)
                        }
                        .onTapGesture {
                            navigation.popToRoot()
                            navigation.path.append(Destination.seriesList)
                            navigation.path.append(
                                Destination.serieDetail(serie: serie)
                            )
                        }
                    }
                }

                Section("Navigation") {
                    Button {
                        navigation.popToRoot()
                        navigation.path.append(
                            Destination.messageDelivery(
                                message: "Settings message: Hello! :)"
                            )
                        )
                    } label: {
                        Text("Send a new message")
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
