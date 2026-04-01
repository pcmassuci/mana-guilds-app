import Foundation

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
