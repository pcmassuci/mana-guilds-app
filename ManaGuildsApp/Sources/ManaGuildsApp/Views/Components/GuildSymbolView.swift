import SwiftUI

struct GuildSymbolView: View {
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
