import SwiftUI
import NavigationBackport

struct MessageDeliveryView: View {
    let message: String
    @EnvironmentObject var navigation: PathNavigator

    var body: some View {
        VStack {
            List {
                Section("Message") {
                    Text(message)
                }

                Section("Navigation") {
                    Button {
                        navigation.popToRoot()
                        navigation.path.append(Destination.seriesList)
                    } label: {
                        Text("Go To Series List")
                    }
                    Button {
                        navigation.popToRoot()
                    } label: {
                        Text("Go To Root View")
                    }
                }
            }
        }
        .navigationTitle("Message Delivery")
    }
}

struct HelloPageView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        MessageDeliveryView(message: "Hello")
    }
}
