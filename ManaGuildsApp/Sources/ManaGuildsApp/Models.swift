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

struct Guild: Identifiable, Hashable {
    let name: String
    let subtitle: String
    let colors: Set<ManaColor>

    var id: String { name }

    static let all: [Guild] = [
        Guild(name: "Azorius", subtitle: "Branco + Azul", colors: [.white, .blue]),
        Guild(name: "Dimir", subtitle: "Azul + Preto", colors: [.blue, .black]),
        Guild(name: "Rakdos", subtitle: "Preto + Vermelho", colors: [.black, .red]),
        Guild(name: "Gruul", subtitle: "Vermelho + Verde", colors: [.red, .green]),
        Guild(name: "Selesnya", subtitle: "Verde + Branco", colors: [.green, .white]),
        Guild(name: "Orzhov", subtitle: "Branco + Preto", colors: [.white, .black]),
        Guild(name: "Izzet", subtitle: "Azul + Vermelho", colors: [.blue, .red]),
        Guild(name: "Golgari", subtitle: "Preto + Verde", colors: [.black, .green]),
        Guild(name: "Boros", subtitle: "Vermelho + Branco", colors: [.red, .white]),
        Guild(name: "Simic", subtitle: "Verde + Azul", colors: [.green, .blue])
    ]
}

extension Set where Element == ManaColor {
    var orderedColors: [ManaColor] {
        ManaColor.allCases.filter { contains($0) }
    }
}
