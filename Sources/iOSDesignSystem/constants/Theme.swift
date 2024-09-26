import SwiftUI

public protocol ThemeProtocol {
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
    var category: [Int: Color] { get }
    var onCategory: Color { get }
}

public struct LightTheme: ThemeProtocol {
    public var background: Color = Color(hex: "#F7F5FA")
    public var onBackground: Color = Color(hex: "#1A1A1A")
    public var surfaceContainer: Color = Color(hex: "#FFFFFF")
    public var surfaceDisabled: Color = Color(hex: "#EEEEEE")
    public var surfaceOutline: Color = Color(hex: "#E3E3E3")
    public var onSurfaceContrast: Color = Color(hex: "#4B5055")
    public var onSurface: Color = Color(hex: "#1A1A1A")
    public var white20: Color = Color.white.opacity(0.2)
    public var black20: Color = Color.black.opacity(0.2)
    public var primary: Color = Color(hex: "#453182")
    public var onPrimary: Color = Color(hex: "#FFFFFF")
    public var secondary: Color = Color(hex: "#836FFF")
    public var onSecondary: Color = Color(hex: "#FFFFFF")
    public var secondaryContrast: Color = Color(hex: "#F7E8BA")
    public var onSecondaryContrast: Color = Color(hex: "#1A1A1A")
    public var tertiary: Color = Color(hex: "#15F5BA")
    public var onTertiary: Color = Color(hex: "#1A1A1A")
    public var tertiaryContrast: Color = Color(hex: "#C0E5F2")
    public var onTertiaryContrast: Color = Color(hex: "#1A1A1A")
    public var success: Color = Color(hex: "#0A7625")
    public var onSuccess: Color = Color(hex: "#FFFFFF")
    public var successContrast: Color = Color(hex: "#BEF4C2")
    public var onSuccessContrast: Color = Color(hex: "#1A1A1A")
    public var danger: Color = Color(hex: "#B2261A")
    public var onDanger: Color = Color(hex: "#FFFFFF")
    public var dangerContrast: Color = Color(hex: "#F5BCBC")
    public var onDangerContrast: Color = Color(hex: "#1A1A1A")
    public var category: [Int: Color] = [
        1: Color(hex: "#A6E548"),
        2: Color(hex: "#C48EFA"),
        3: Color(hex: "#5DD2FA"),
        4: Color(hex: "#F6BF56"),
        5: Color(hex: "#FA865F"),
        6: Color(hex: "#F8D157"),
        7: Color(hex: "#F091CA"),
        8: Color(hex: "#6BDC9F"),
        9: Color(hex: "#84A1FF")
    ]
    public var onCategory: Color = Color(hex: "#191919")
    
    public init() {}
}


public struct DarkTheme: ThemeProtocol {
    public var background: Color = Color(red: 25/255, green: 18/255, blue: 57/255) // #191239
    public var onBackground: Color = Color.white // #FFFFFF
    public var surfaceContainer: Color = Color(red: 50/255, green: 36/255, blue: 114/255) // #322472
    public var surfaceDisabled: Color = Color(red: 78/255, green: 69/255, blue: 135/255) // #4E4587
    public var surfaceOutline: Color = Color(red: 75/255, green: 61/255, blue: 137/255) // #4B3D89
    public var onSurfaceContrast: Color = Color(red: 195/255, green: 190/255, blue: 218/255) // #C3BEDA
    public var onSurface: Color = Color.white // #FFFFFF
    public var white20: Color = Color.white.opacity(0.2) // #FFFFFF33
    public var black20: Color = Color.black.opacity(0.2) // #1D1B2033
    public var primary: Color = Color.white // #FFFFFF
    public var onPrimary: Color = Color(red: 33/255, green: 25/255, blue: 81/255) // #211951
    public var secondary: Color = Color(red: 131/255, green: 111/255, blue: 255/255) // #836FFF
    public var onSecondary: Color = Color.white // #FFFFFF
    public var secondaryContrast: Color = Color(red: 245/255, green: 214/255, blue: 61/255) // #F5D63D
    public var onSecondaryContrast: Color = Color(red: 26/255, green: 26/255, blue: 26/255) // #1A1A1A
    public var tertiary: Color = Color(red: 21/255, green: 245/255, blue: 186/255) // #15F5BA
    public var onTertiary: Color = Color(red: 26/255, green: 26/255, blue: 26/255) // #1A1A1A
    public var tertiaryContrast: Color = Color(red: 200/255, green: 229/255, blue: 250/255) // #C8E5FA
    public var onTertiaryContrast: Color = Color(red: 26/255, green: 26/255, blue: 26/255) // #1A1A1A
    public var success: Color = Color(red: 112/255, green: 219/255, blue: 115/255) // #70DB73
    public var onSuccess: Color = Color.white // #FFFFFF
    public var successContrast: Color = Color(red: 190/255, green: 244/255, blue: 194/255) // #BEF4C2
    public var onSuccessContrast: Color = Color(red: 26/255, green: 26/255, blue: 26/255) // #1A1A1A
    public var danger: Color = Color(red: 178/255, green: 38/255, blue: 26/255) // #B2261A
    public var onDanger: Color = Color.white // #FFFFFF
    public var dangerContrast: Color = Color(red: 245/255, green: 188/255, blue: 188/255) // #F5BCBC
    public var onDangerContrast: Color = Color(red: 26/255, green: 26/255, blue: 26/255) // #1A1A1A
    public var category: [Int: Color] = [
        1: Color(red: 166/255, green: 229/255, blue: 72/255), // #A6E548
        2: Color(red: 196/255, green: 142/255, blue: 250/255), // #C48EFA
        3: Color(red: 93/255, green: 210/255, blue: 250/255), // #5DD2FA
        4: Color(red: 246/255, green: 191/255, blue: 86/255), // #F6BF56
        5: Color(red: 250/255, green: 134/255, blue: 95/255), // #FA865F
        6: Color(red: 248/255, green: 209/255, blue: 87/255), // #F8D157
        7: Color(red: 240/255, green: 145/255, blue: 202/255), // #F091CA
        8: Color(red: 107/255, green: 220/255, blue: 159/255), // #6BDC9F
        9: Color(red: 132/255, green: 161/255, blue: 255/255) // #84A1FF
    ]
    public var onCategory: Color = Color.white // #FFFFFF
    
    public init() {}
}
