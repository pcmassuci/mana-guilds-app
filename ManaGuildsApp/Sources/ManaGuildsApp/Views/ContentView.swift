import SwiftUI

struct ContentView: View {
    @State private var selectedColors: Set<ManaColor> = [.white, .blue]

    private var matchingGuilds: [Guild] {
        Guild.all.filter { $0.colors.isSubset(of: selectedColors) }
    }

    private var matchingClans: [TarkirClan] {
        TarkirClan.all.filter { $0.colors.isSubset(of: selectedColors) }
    }

    private var matchingShards: [AlaraShard] {
        AlaraShard.all.filter { $0.colors.isSubset(of: selectedColors) }
    }

    private var selectedColorNames: String {
        selectedColors.orderedColors.map(\.name).joined(separator: ", ")
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.08, green: 0.10, blue: 0.16),
                        Color(red: 0.15, green: 0.18, blue: 0.26),
                        Color(red: 0.27, green: 0.18, blue: 0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        headerCard
                        colorPickerSection
                        guildSection
                        clanSection
                        shardSection
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Faccoes de Magic")
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Escolha de 2 a 5 cores")
                .font(.title2.weight(.bold))
                .foregroundStyle(.white)

            Text("Ao combinar as cores, o app mostra as guildas de Ravnica, os Tarkir Clans e os Alara Shards contidos nessa selecao.")
                .font(.body)
                .foregroundStyle(.white.opacity(0.82))

            Text("Selecionadas: \(selectedColorNames)")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.top, 4)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.white.opacity(0.14), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
    }

    private var colorPickerSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Cores")
                .font(.title3.weight(.semibold))
                .foregroundStyle(.white)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(ManaColor.allCases) { color in
                    ColorSelectionButton(
                        color: color,
                        isSelected: selectedColors.contains(color),
                        isLocked: selectedColors.count == 2 && selectedColors.contains(color),
                        action: { toggle(color) }
                    )
                }
            }
        }
    }

    private var guildSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Guildas de Ravnica")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)

                Spacer()

                Text("\(matchingGuilds.count)")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(.white.opacity(0.8))
            }

            ForEach(matchingGuilds) { guild in
                GuildCard(guild: guild)
            }
        }
    }

    private var clanSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Tarkir Clans")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)

                Spacer()

                Text("\(matchingClans.count)")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(.white.opacity(0.8))
            }

            if matchingClans.isEmpty {
                Text("Selecione pelo menos tres cores para revelar os Tarkir Clans.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.72))
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white.opacity(0.08))
                    .clipShape(.rect(cornerRadius: 18))
            } else {
                ForEach(matchingClans) { clan in
                    TricolorFactionCard(
                        name: clan.name,
                        fullName: clan.fullName,
                        subtitle: clan.subtitle,
                        focus: clan.focus,
                        colors: clan.colors,
                        assetName: clan.assetName
                    )
                }
            }
        }
    }

    private var shardSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Alara Shards")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)

                Spacer()

                Text("\(matchingShards.count)")
                    .font(.headline.monospacedDigit())
                    .foregroundStyle(.white.opacity(0.8))
            }

            if matchingShards.isEmpty {
                Text("Selecione pelo menos tres cores para revelar os Alara Shards.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.72))
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white.opacity(0.08))
                    .clipShape(.rect(cornerRadius: 18))
            } else {
                ForEach(matchingShards) { shard in
                    TricolorFactionCard(
                        name: shard.name,
                        fullName: shard.fullName,
                        subtitle: shard.subtitle,
                        focus: shard.focus,
                        colors: shard.colors,
                        assetName: shard.assetName
                    )
                }
            }
        }
    }

    private func toggle(_ color: ManaColor) {
        if selectedColors.contains(color) {
            guard selectedColors.count > 2 else { return }
            selectedColors.remove(color)
        } else {
            selectedColors.insert(color)
        }
    }
}
