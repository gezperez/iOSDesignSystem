import SwiftUI

public enum IconSize {
    case lg
    case md
    case sm
    
    var size: CGSize {
        switch self {
        case .lg:
            return CGSize(width: 64, height: 64) // Large size
        case .md:
            return CGSize(width: 48, height: 48) // Medium size
        case .sm:
            return CGSize(width: 24, height: 24) // Small size
        }
    }
}

public struct DSIconProps {
    var systemImageName: String
    var size: IconSize
    var color: Color
    
    public init(
        systemImageName: String,
        size: IconSize = .md,
        color: Color = .black
    ) {
        self.systemImageName = systemImageName
        self.size = size
        self.color = color
    }
}

struct DSIcon: View {
    public var iconProps: DSIconProps
    
    public init(iconProps: DSIconProps) {
        self.iconProps = iconProps
    }
    
    var body: some View {
        Image(systemName: iconProps.systemImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
                width: iconProps.size.size.width,
                height: iconProps.size.size.height
            )
            .foregroundColor(iconProps.color)
            .environmentObject(ThemeManager())
    }
    
}

#Preview {
    VStack {
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .sm))
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .md))
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .lg))
    }
    
}
