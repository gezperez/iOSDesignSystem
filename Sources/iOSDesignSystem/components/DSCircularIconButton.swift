import SwiftUI

struct CircularButtonScheme {
    var dimension: CGFloat
    var padding: CGFloat
}

public enum ButtonSize {
    case lg
    case md
    case sm
    
    var size: CircularButtonScheme {
        switch self {
            case .lg:
                return CircularButtonScheme(dimension: 80, padding: 18)
            case .md:
                return CircularButtonScheme(dimension: 60, padding: 16)
            case .sm:
                return CircularButtonScheme(dimension: 40, padding: 10)
        }
    }
}

public struct DSCircularIconButtonProps {
    var systemImageName: String
    var action: () -> Void
    var variant: ButtonVariant
    var size: ButtonSize
    public var isDisabled: Bool?
    public var isLoading: Bool?
    
    public init(
        systemImageName: String,
        variant: ButtonVariant,
        action: @escaping () -> Void,
        size: ButtonSize = .md,
        isDisabled: Bool = false,
        isLoading: Bool = false
    ) {
        self.systemImageName = systemImageName
        self.variant = variant
        self.action = action
        self.size = size
        self.isLoading = isLoading
        self.isDisabled = isDisabled
    }
}

public struct DSCircularIconButton: View {
    @StateObject private var themeManager = ThemeManager()
    
    private var colorProvider: ButtonColorSchemeProvider
    
    public var buttonProps: DSCircularIconButtonProps
    
    public init(buttonProps: DSCircularIconButtonProps) {
        self.buttonProps = buttonProps
        self.colorProvider = ButtonColorSchemeProvider()
    }
    
    private var isButtonDisabled: Bool {
        (buttonProps.isDisabled ?? false) || (buttonProps.isLoading ?? false)
    }
    
    private func renderContent() -> some View {
        let colors = colorProvider.colorScheme(
            themeManager: themeManager,
            isDisabled: buttonProps.isDisabled!,
            variant: buttonProps.variant
        )
        
        if buttonProps.isLoading! && !buttonProps.isDisabled! {
            return AnyView(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(
                        width: buttonProps.size.size.dimension,
                        height: buttonProps.size.size.dimension
                    )
                    .background(colors.backgroundColor)
                    .tint(colors.textColor)
                    .cornerRadius(CornerRadius.infinite.rawValue)
            )
        }
        
        return AnyView(
            Image(systemName: buttonProps.systemImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(buttonProps.size.size.padding)
                .frame(
                    width: buttonProps.size.size.dimension,
                    height: buttonProps.size.size.dimension
                )
                .background(colors.backgroundColor)
                .foregroundColor(colors.textColor)
                .clipShape(Circle())
        )
    }
    
    public var body: some View {
   
        Button(action: buttonProps.action) {
            renderContent()
        }
        .disabled(isButtonDisabled)
    }
}

#Preview {    
    HStack {
        VStack {
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .lg,
                    isDisabled: true
                )
            )
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .lg,
                    isLoading: true
                )
            )
            
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .lg
                )
            )
            
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .md
                )
            )
            
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .md,
                    isLoading: true
                )
            )
            
            DSCircularIconButton(
                buttonProps: DSCircularIconButtonProps(
                    systemImageName: "heart.fill",
                    variant: .primary,
                    action: {},
                    size: .sm
                )
            )
        }
        .padding()
        
    }
    .environmentObject(ThemeManager())
}
