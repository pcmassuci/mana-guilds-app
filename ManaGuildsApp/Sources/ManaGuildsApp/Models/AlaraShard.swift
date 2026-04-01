import Foundation

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
