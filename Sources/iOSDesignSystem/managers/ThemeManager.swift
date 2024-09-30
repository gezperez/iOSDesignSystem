import SwiftUI

public class ThemeManager: ObservableObject {
    @Published private var theme: ThemeProtocol = MainTheme()

    public var current: ThemeProtocol {
        return theme
    }

    public init() {}

    public func setTheme(to newTheme: ThemeProtocol) {
        self.theme = newTheme
    }

}
