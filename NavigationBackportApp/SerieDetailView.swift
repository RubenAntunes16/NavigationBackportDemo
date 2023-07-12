import SwiftUI
import NavigationBackport

struct SerieDetailView: View {
    var serie: Serie
    @EnvironmentObject var navigation: PathNavigator

    var body: some View {
        VStack {
            List {
                Section("Year") {
                    Text(serie.year)
                }
                Section("Sinopse") {
                    Text(serie.description)
                }
                Section("Actors") {
                    ForEach(serie.actors, id: \.self) { name in
                        Text(name)
                    }
                }

                Section("Navigation") {
                    Button {
                        navigation.popToRoot()
                        navigation.path.append(Destination.settings)
                    } label: {
                        Text("Go To Settings")
                    }
                    Button {
                        navigation.path.append(
                            Destination.messageDelivery(message: "This is the last View of this demo.")
                        )
                    } label: {
                        Text("Message Delivery View")
                    }
                    Button {
                        navigation.popToRoot()
                    } label: {
                        Text("Go To Root View")
                    }
                }
            }
        }
        .navigationTitle(serie.title)
    }
}

struct Page3View_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SerieDetailView(serie: Serie(title: "Teste", year: "2023", description: "Isto é uma description", actors: ["Person1", "Person2"]))
    }
}
