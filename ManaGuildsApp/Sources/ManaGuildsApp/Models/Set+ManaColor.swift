import Foundation

extension Set where Element == ManaColor {
    var orderedColors: [ManaColor] {
        ManaColor.allCases.filter { contains($0) }
    }
}
