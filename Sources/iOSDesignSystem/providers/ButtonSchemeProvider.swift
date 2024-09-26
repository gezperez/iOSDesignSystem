import SwiftUICore

struct ButtonColorScheme {
    var backgroundColor: Color
    var textColor: Color
    var borderColor: Color
}

public struct ButtonColorSchemeProvider {
    func colorScheme(themeManager: ThemeManager, isDisabled: Bool, variant: ButtonVariant) -> ButtonColorScheme {
        
        if isDisabled {
            return ButtonColorScheme(
                backgroundColor: themeManager.current.surfaceDisabled,
                textColor: themeManager.current.onSurfaceContrast,
                borderColor: Color.clear
            )
        }
        
        switch variant {
            case .primary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.primary,
                    textColor: themeManager.current.onPrimary,
                    borderColor: Color.clear
                )
            case .secondary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.secondary,
                    textColor: themeManager.current.onSecondary,
                    borderColor: Color.clear
                )
            case .tertiary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.tertiary,
                    textColor: themeManager.current.onTertiary,
                    borderColor: Color.clear
                )
            case .destructive:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.danger,
                    textColor: themeManager.current.onDanger,
                    borderColor: Color.clear
                )
            case .outlinePrimary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.background,
                    textColor: themeManager.current.primary,
                    borderColor: themeManager.current.primary
                )
            case .outlineSecondary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.background,
                    textColor: themeManager.current.secondary,
                    borderColor: themeManager.current.secondary
                )
            case .outlineTertiary:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.background,
                    textColor: themeManager.current.tertiary,
                    borderColor: themeManager.current.tertiary
                )
            case .outlineDestructive:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.background,
                    textColor: themeManager.current.danger,
                    borderColor: themeManager.current.danger
                )
            case .disabled:
                return ButtonColorScheme(
                    backgroundColor: themeManager.current.surfaceDisabled,
                    textColor: themeManager.current.onSurfaceContrast,
                    borderColor: Color.clear
                )
        }
    }
}
