import SwiftUI

struct ColorSelectionButton: View {
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
