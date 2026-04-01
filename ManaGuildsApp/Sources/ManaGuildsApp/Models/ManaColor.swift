import SwiftUI

enum ManaColor: String, CaseIterable, Identifiable, Hashable {
    case white
    case blue
    case black
    case red
    case green

    var id: String { rawValue }

    var name: String {
        switch self {
        case .white: "Branco"
        case .blue: "Azul"
        case .black: "Preto"
        case .red: "Vermelho"
        case .green: "Verde"
        }
    }

    var symbol: String {
        switch self {
        case .white: "sun.max.fill"
        case .blue: "drop.fill"
        case .black: "moon.stars.fill"
        case .red: "flame.fill"
        case .green: "leaf.fill"
        }
    }

    var tint: Color {
        switch self {
        case .white: Color(red: 0.97, green: 0.92, blue: 0.72)
        case .blue: Color(red: 0.33, green: 0.58, blue: 0.93)
        case .black: Color(red: 0.23, green: 0.24, blue: 0.29)
        case .red: Color(red: 0.90, green: 0.35, blue: 0.26)
        case .green: Color(red: 0.26, green: 0.60, blue: 0.39)
        }
    }

    var textColor: Color {
        switch self {
        case .white: .black
        default: .white
        }
    }
}
