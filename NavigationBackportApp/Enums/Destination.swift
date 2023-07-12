import Foundation

enum Destination: Hashable, Codable {
    case seriesList
    case serieDetail(serie: Serie)
    case messageDelivery(message: String)
    case settings

    enum Key: CodingKey {
        case type
        case serie
        case message
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
        case "seriesList":
            self = .seriesList
        case "serieDetail":
            let serie = try container.decode(Serie.self, forKey: .serie)
            self = .serieDetail(serie: serie)
        case "messageDelivery":
            let message = try container.decode(String.self, forKey: .message)
            self = .messageDelivery(message: message)
        default:
            self = .settings
        }
    }
}
