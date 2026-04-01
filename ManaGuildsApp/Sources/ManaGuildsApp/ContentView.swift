import SwiftUI

struct ContentView: View {
    @State private var selectedColors: Set<ManaColor> = [.white, .blue]

    private var matchingGuilds: [Guild] {
        Guild.all.filter { $0.colors.isSubset(of: selectedColors) }
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
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Guildas de Magic")
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Escolha de 2 a 5 cores")
                .font(.title2.weight(.bold))
                .foregroundStyle(.white)

            Text("Ao combinar as cores, o app mostra quais guildas de Ravnica existem dentro dessa seleção.")
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
                Text("Guildas encontradas")
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

    private func toggle(_ color: ManaColor) {
        if selectedColors.contains(color) {
            guard selectedColors.count > 2 else { return }
            selectedColors.remove(color)
        } else {
            selectedColors.insert(color)
        }
    }
}

private struct ColorSelectionButton: View {
    let color: ManaColor
    let isSelected: Bool
    let isLocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: color.symbol)
                    .font(.title3)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 4) {
                    Text(color.name)
                        .font(.headline)
                    Text(isSelected ? "Selecionada" : "Toque para selecionar")
                        .font(.caption)
                        .opacity(0.85)
                }

                Spacer()

                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title3.weight(.semibold))
                    .accessibilityHidden(true)
            }
            .foregroundStyle(color.textColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity, minHeight: 92)
            .background(
                LinearGradient(
                    colors: [color.tint.opacity(isSelected ? 1.0 : 0.78), color.tint.opacity(0.76)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(.rect(cornerRadius: 22))
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(.white.opacity(isSelected ? 0.55 : 0.18), lineWidth: 1.5)
            )
            .scaleEffect(isSelected ? 1.0 : 0.98)
            .animation(.spring(duration: 0.25), value: isSelected)
        }
        .buttonStyle(.plain)
        .disabled(isLocked)
        .accessibilityLabel(color.name)
        .accessibilityValue(isSelected ? "Selecionada" : "Não selecionada")
        .accessibilityHint(isLocked ? "Você precisa manter pelo menos duas cores selecionadas" : "Alterna a seleção dessa cor")
        .accessibilityAddTraits(isSelected ? [.isSelected, .isButton] : .isButton)
    }
}

private struct GuildCard: View {
    let guild: Guild

    var body: some View {
        HStack(spacing: 14) {
            GuildSymbolView(guild: guild)

            VStack(alignment: .leading, spacing: 4) {
                Text(guild.name)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(guild.fullName)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.white.opacity(0.88))

                Text(guild.subtitle)
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.72))
            }

            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.10))
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.10), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(guild.fullName), \(guild.subtitle)")
    }
}

private struct GuildSymbolView: View {
    let guild: Guild

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.white.opacity(0.08))

            if let assetName = guild.assetName {
                Image(assetName)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .colorMultiply(.white)
            } else {
                fallbackMarks
            }
        }
        .frame(width: 62, height: 62)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(.white.opacity(0.12), lineWidth: 1)
        )
        .accessibilityHidden(true)
    }

    private var fallbackMarks: some View {
        HStack(spacing: 6) {
            ForEach(guild.colors.orderedColors) { color in
                Circle()
                    .fill(color.tint)
                    .frame(width: 14, height: 14)
                    .overlay(Circle().stroke(.white.opacity(0.5), lineWidth: 1))
            }
        }
    }
}
