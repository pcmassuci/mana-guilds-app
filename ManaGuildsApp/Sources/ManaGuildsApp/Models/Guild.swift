import Foundation

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
