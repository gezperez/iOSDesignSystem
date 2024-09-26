import SwiftUI

public class ThemeManager: ObservableObject {
    @Published private var theme: ThemeProtocol = LightTheme() // Default theme

    public var current: ThemeProtocol {
        return theme
    }

    public init() {}

    // Method to switch themes
    public func switchTheme(to newTheme: ThemeProtocol) {
        self.theme = newTheme
    }
}
