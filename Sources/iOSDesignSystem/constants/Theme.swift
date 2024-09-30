import SwiftUI

public protocol ThemeProtocol {
    var headlineH1: Font { get }
    var headlineH2: Font { get }
    var headlineH3: Font { get }
    var headlineH4: Font { get }
    var headlineH5: Font { get }
    var bodyExtraLargeBold: Font { get }
    var bodyExtraLargeRegular: Font { get }
    var bodyLargeBold: Font { get }
    var bodyLargeRegular: Font { get }
    var bodyDefaultBold: Font { get }
    var bodyDefaultRegular: Font { get }
    var bodySmallBold: Font { get }
    var bodySmallRegular: Font { get }
    var linkLarge: Font { get }
    var linkDefault: Font { get }
    var linkSmall: Font { get }
    var captionDefault: Font { get }
    var captionSmall: Font { get }
    
    var background: Color { get }
    var onBackground: Color { get }
    var surfaceContainer: Color { get }
    var surfaceDisabled: Color { get }
    var surfaceOutline: Color { get }
    var onSurfaceContrast: Color { get }
    var onSurface: Color { get }
    var white20: Color { get }
    var black20: Color { get }
    var primary: Color { get }
    var onPrimary: Color { get }
    var secondary: Color { get }
    var onSecondary: Color { get }
    var secondaryContrast: Color { get }
    var onSecondaryContrast: Color { get }
    var tertiary: Color { get }
    var onTertiary: Color { get }
    var tertiaryContrast: Color { get }
    var onTertiaryContrast: Color { get }
    var success: Color { get }
    var onSuccess: Color { get }
    var successContrast: Color { get }
    var onSuccessContrast: Color { get }
    var danger: Color { get }
    var onDanger: Color { get }
    var dangerContrast: Color { get }
    var onDangerContrast: Color { get }
}

public struct MainTheme: ThemeProtocol {
    public var background: Color { return Color("background") }
    public var onBackground: Color { return Color("onBackground") }
    public var surfaceContainer: Color { return Color("surfaceContainer") }
    public var surfaceDisabled: Color { return Color("surfaceDisabled") }
    public var surfaceOutline: Color { return Color("surfaceOutline") }
    public var onSurfaceContrast: Color { return Color("onSurfaceContrast") }
    public var onSurface: Color { return Color("onSurface") }
    public var white20: Color { return Color("white20") }
    public var black20: Color { return Color("black20") }
    public var primary: Color { return Color("primary") }
    public var onPrimary: Color { return Color("onPrimary") }
    public var secondary: Color { return Color("secondary") }
    public var onSecondary: Color { return Color("onSecondary") }
    public var secondaryContrast: Color { return Color("secondaryContrast") }
    public var onSecondaryContrast: Color { return Color("onSecondaryContrast") }
    public var tertiary: Color { return Color("tertiary") }
    public var onTertiary: Color { return Color("onTertiary") }
    public var tertiaryContrast: Color { return Color("tertiaryContrast") }
    public var onTertiaryContrast: Color { return Color("onTertiaryContrast") }
    public var success: Color { return Color("success") }
    public var onSuccess: Color { return Color("onSuccess") }
    public var successContrast: Color { return Color("successContrast") }
    public var onSuccessContrast: Color { return Color("onSuccessContrast") }
    public var danger: Color { return Color("danger") }
    public var onDanger: Color { return Color("onDanger") }
    public var dangerContrast: Color { return Color("dangerContrast") }
    public var onDangerContrast: Color { return Color("onDangerContrast") }
    
    public var headlineH1: Font = Font.custom(FontFamily.extraBold.rawValue, size: 48)
    
    public var headlineH2: Font = Font.custom(FontFamily.extraBold.rawValue, size: 32)
    
    public var headlineH3: Font = Font.custom(FontFamily.bold.rawValue, size: 24)
    
    public var headlineH4: Font = Font.custom(FontFamily.bold.rawValue, size: 18)
    
    public var headlineH5: Font = Font.custom(FontFamily.bold.rawValue, size: 16)
    
    public var bodyExtraLargeBold: Font = Font.custom(FontFamily.semibold.rawValue, size: 20)
    
    public var bodyExtraLargeRegular: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 20
    )
    
    public var bodyLargeBold: Font = Font.custom(
        FontFamily.semibold.rawValue,
        size: 16
    )
    
    public var bodyLargeRegular: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 16
    )
    
    public var bodyDefaultBold: Font = Font.custom(
        FontFamily.semibold.rawValue,
        size: 14
    )
    
    public var bodyDefaultRegular: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 14
    )
    
    public var bodySmallBold: Font = Font.custom(
        FontFamily.semibold.rawValue,
        size: 12
    )
    
    public var bodySmallRegular: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 12
    )
    
    public var linkLarge: Font = Font.custom(
        FontFamily.semibold.rawValue,
        size: 16
    )
    
    public var linkDefault: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 14
    )
    
    public var linkSmall: Font = Font.custom(
        FontFamily.semibold.rawValue,
        size: 12
    )
    
    public var captionDefault: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 14
    )
    
    public var captionSmall: Font = Font.custom(
        FontFamily.regular.rawValue,
        size: 12
    )
    
    
    
    public init() {}
}

