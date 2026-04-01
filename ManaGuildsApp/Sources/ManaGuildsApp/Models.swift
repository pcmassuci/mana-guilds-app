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
    let fullName: String
    let subtitle: String
    let colors: Set<ManaColor>
    let assetName: String?

    var id: String { name }

    static let all: [Guild] = [
        Guild(
            name: "Azorius",
            fullName: "Azorius Senate",
            subtitle: "Branco + Azul",
            colors: [.white, .blue],
            assetName: "Azorius"
        ),
        Guild(
            name: "Dimir",
            fullName: "House Dimir",
            subtitle: "Azul + Preto",
            colors: [.blue, .black],
            assetName: "Dimir"
        ),
        Guild(
            name: "Rakdos",
            fullName: "Cult of Rakdos",
            subtitle: "Preto + Vermelho",
            colors: [.black, .red],
            assetName: "Rakdos"
        ),
        Guild(
            name: "Gruul",
            fullName: "Gruul Clans",
            subtitle: "Vermelho + Verde",
            colors: [.red, .green],
            assetName: "Gruul"
        ),
        Guild(
            name: "Selesnya",
            fullName: "Selesnya Conclave",
            subtitle: "Verde + Branco",
            colors: [.green, .white],
            assetName: "Selesnya"
        ),
        Guild(
            name: "Orzhov",
            fullName: "Orzhov Syndicate",
            subtitle: "Branco + Preto",
            colors: [.white, .black],
            assetName: "Orzhov"
        ),
        Guild(
            name: "Izzet",
            fullName: "Izzet League",
            subtitle: "Azul + Vermelho",
            colors: [.blue, .red],
            assetName: "Izzet"
        ),
        Guild(
            name: "Golgari",
            fullName: "Golgari Swarm",
            subtitle: "Preto + Verde",
            colors: [.black, .green],
            assetName: "Golgari"
        ),
        Guild(
            name: "Boros",
            fullName: "Boros Legion",
            subtitle: "Vermelho + Branco",
            colors: [.red, .white],
            assetName: "Boros"
        ),
        Guild(
            name: "Simic",
            fullName: "Simic Combine",
            subtitle: "Verde + Azul",
            colors: [.green, .blue],
            assetName: nil
        )
    ]
}

struct TarkirClan: Identifiable, Hashable {
    let name: String
    let fullName: String
    let subtitle: String
    let colors: Set<ManaColor>
    let focus: String
    let assetName: String?

    var id: String { name }

    static let all: [TarkirClan] = [
        TarkirClan(
            name: "Abzan",
            fullName: "Abzan Houses",
            subtitle: "White + Black + Green",
            colors: [.white, .black, .green],
            focus: "Endurance, family, and legacy",
            assetName: "Abzan"
        ),
        TarkirClan(
            name: "Jeskai",
            fullName: "Jeskai Way",
            subtitle: "Blue + Red + White",
            colors: [.blue, .red, .white],
            focus: "Discipline, cunning, and speed",
            assetName: "Jeskai"
        ),
        TarkirClan(
            name: "Sultai",
            fullName: "Sultai Brood",
            subtitle: "Black + Green + Blue",
            colors: [.black, .green, .blue],
            focus: "Ambition, wealth, and necromancy",
            assetName: "Sultai"
        ),
        TarkirClan(
            name: "Mardu",
            fullName: "Mardu Horde",
            subtitle: "Red + White + Black",
            colors: [.red, .white, .black],
            focus: "Speed, mobility, and war",
            assetName: "Mardu"
        ),
        TarkirClan(
            name: "Temur",
            fullName: "Temur Frontier",
            subtitle: "Green + Blue + Red",
            colors: [.green, .blue, .red],
            focus: "Strength, instinct, and wilderness",
            assetName: "Temur"
        )
    ]
}

struct AlaraShard: Identifiable, Hashable {
    let name: String
    let fullName: String
    let subtitle: String
    let colors: Set<ManaColor>
    let focus: String
    let assetName: String?

    var id: String { name }

    static let all: [AlaraShard] = [
        AlaraShard(
            name: "Esper",
            fullName: "Shard of Esper",
            subtitle: "White + Blue + Black",
            colors: [.white, .blue, .black],
            focus: "Artifacts, refinement, and control",
            assetName: "Esper"
        ),
        AlaraShard(
            name: "Grixis",
            fullName: "Shard of Grixis",
            subtitle: "Blue + Black + Red",
            colors: [.blue, .black, .red],
            focus: "Death, chaos, and necromancy",
            assetName: "Grixis"
        ),
        AlaraShard(
            name: "Jund",
            fullName: "Shard of Jund",
            subtitle: "Black + Red + Green",
            colors: [.black, .red, .green],
            focus: "Predation, power, and survival",
            assetName: "Jund"
        ),
        AlaraShard(
            name: "Naya",
            fullName: "Shard of Naya",
            subtitle: "Red + Green + White",
            colors: [.red, .green, .white],
            focus: "Nature, strength, and spirituality",
            assetName: "Naya"
        ),
        AlaraShard(
            name: "Bant",
            fullName: "Shard of Bant",
            subtitle: "Green + White + Blue",
            colors: [.green, .white, .blue],
            focus: "Honor, order, and protection",
            assetName: "Bant"
        )
    ]
}

extension Set where Element == ManaColor {
    var orderedColors: [ManaColor] {
        ManaColor.allCases.filter { contains($0) }
    }
}
