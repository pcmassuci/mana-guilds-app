import SwiftUI

struct TricolorFactionCard: View {
    let name: String
    let fullName: String
    let subtitle: String
    let focus: String
    let colors: Set<ManaColor>
    let assetName: String?

    var body: some View {
        HStack(spacing: 14) {
            TricolorFactionSymbolView(colors: colors, assetName: assetName)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(fullName)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.white.opacity(0.88))

                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(.white.opacity(0.72))

                Text(focus)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.62))
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
        .accessibilityLabel("\(fullName), \(subtitle)")
    }
}
