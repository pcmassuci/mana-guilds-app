import SwiftUI

struct GuildCard: View {
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
