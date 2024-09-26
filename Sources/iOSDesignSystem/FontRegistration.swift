import SwiftUI

public enum FontFamily: String, CaseIterable {
    case black = "Inter-Black"
    case bold = "Inter-Bold"
    case extraBold = "Inter-ExtraBold"
    case extraLight = "Inter-ExtraLight"
    case light = "Inter-Light"
    case medium = "Inter-Medium"
    case regular = "Inter-Regular"
    case semibold = "Inter-SemiBold"
    case thin = "Inter-Thin"
}

public struct TypographyVariant {
    
    public static let headlineH1 = Font.custom(FontFamily.extraBold.rawValue, size: 48)
        .lineHeight(56)
        .letterSpacing(-1)
    
    public static let headlineH2 = Font.custom(FontFamily.extraBold.rawValue, size: 32)
        .lineHeight(48)
        .letterSpacing(-1)
    
    public static let headlineH3 = Font.custom(FontFamily.bold.rawValue, size: 24)
        .lineHeight(32)
        .letterSpacing(-1)
    
    public static let headlineH4 = Font.custom(FontFamily.bold.rawValue, size: 18)
        .lineHeight(24)
        .letterSpacing(-1)
    
    public static let headlineH5 = Font.custom(FontFamily.bold.rawValue, size: 16)
        .lineHeight(24)
        .letterSpacing(-1)
    
    public static let bodyExtraLargeBold = Font.custom(FontFamily.semibold.rawValue, size: 16)
        .lineHeight(24)
        .letterSpacing(-0.5)
    
    public static let bodyExtraLargeRegular = Font.custom(FontFamily.regular.rawValue, size: 20)
        .lineHeight(28)
        .letterSpacing(-0.5)
    
    public static let bodyLargeBold = Font.custom(FontFamily.semibold.rawValue, size: 16)
        .lineHeight(24)
        .letterSpacing(-0.5)
    
    public static let bodyLargeRegular = Font.custom(FontFamily.regular.rawValue, size: 16)
        .lineHeight(24)
        .letterSpacing(-0.5)
    
    public static let bodyDefaultBold = Font.custom(FontFamily.semibold.rawValue, size: 14)
        .lineHeight(20)
        .letterSpacing(0)
    
    public static let bodyDefaultRegular = Font.custom(FontFamily.regular.rawValue, size: 14)
        .lineHeight(20)
        .letterSpacing(0)
    
    public static let bodySmallBold = Font.custom(FontFamily.semibold.rawValue, size: 12)
        .lineHeight(16)
        .letterSpacing(0)
    
    public static let bodySmallRegular = Font.custom(FontFamily.regular.rawValue, size: 12)
        .lineHeight(16)
        .letterSpacing(0)
    
    public static let linkLarge = Font.custom(FontFamily.semibold.rawValue, size: 16)
        .lineHeight(24)
        .letterSpacing(-0.5)
    
    public static let linkDefault = Font.custom(FontFamily.semibold.rawValue, size: 14)
        .lineHeight(20)
        .letterSpacing(0)
    
    public static let linkSmall = Font.custom(FontFamily.semibold.rawValue, size: 12)
        .lineHeight(16)
        .letterSpacing(0)
    
    public static let captionDefault = Font.custom(FontFamily.regular.rawValue, size: 14)
        .lineHeight(20)
        .letterSpacing(0)
    
    public static let captionSmall = Font.custom(FontFamily.regular.rawValue, size: 12)
        .lineHeight(16)
        .letterSpacing(0)
}

// Extension to add line height and letter spacing to Font
extension Font {
    func lineHeight(_ height: CGFloat) -> Font {
        // Custom implementation if necessary for spacing
        return self
    }

    func letterSpacing(_ spacing: CGFloat) -> Font {
        // Custom implementation if necessary for spacing
        return self
    }
}
