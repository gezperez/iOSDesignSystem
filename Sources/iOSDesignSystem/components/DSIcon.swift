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
    var action: (() -> Void)?
    
    public init(
        systemImageName: String,
        size: IconSize = .md,
        color: Color = .black,
        action: (() -> Void)? = nil
    ) {
        self.systemImageName = systemImageName
        self.size = size
        self.color = color
        self.action = action
    }
}

struct DSIcon: View {
    public var iconProps: DSIconProps
    
    public init(iconProps: DSIconProps) {
        self.iconProps = iconProps
    }
    
    private var iconAction: () -> Void {
        
        if let action = iconProps.action {
            return action
        }
        
        return {}
    }
    
    var body: some View {
        Button(action: iconAction) {
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
        .disabled(iconProps.action == nil)
        
    }
    
}

#Preview {
    VStack {
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .sm))
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .md))
        DSIcon(iconProps: DSIconProps(systemImageName: "heart.fill", size: .lg))
    }
    
}
