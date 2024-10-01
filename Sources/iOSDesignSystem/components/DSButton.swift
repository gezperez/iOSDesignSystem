import SwiftUI

public struct DSButtonProps {
    public var title: String
    public var variant: ButtonVariant
    public var action: () -> Void
    public var isDisabled: Bool?
    public var isLoading: Bool?
    public var fullWidth: Bool // New property for full width
    
    public init(
        title: String,
        variant: ButtonVariant,
        action: @escaping () -> Void,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        fullWidth: Bool = true
    ) {
        self.title = title
        self.variant = variant
        self.action = action
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.fullWidth = fullWidth
    }
}

public struct DSButton: View {
    @StateObject private var themeManager = ThemeManager()
    
    private var colorProvider: ButtonColorSchemeProvider
    
    public var buttonProps: DSButtonProps
    
    public init(buttonProps: DSButtonProps) {
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
                    .background(colors.backgroundColor)
                    .padding(.horizontal, 32)
                    .frame(maxWidth: buttonProps.fullWidth ? .infinity : nil)
                    .frame(height: 60)
                    .tint(colors.textColor)
                    .cornerRadius(CornerRadius.infinite.rawValue)
            )
        }
        
        return AnyView(
            Text(NSLocalizedString(buttonProps.title, comment: ""))
                .font(themeManager.current.bodyLargeBold)
                .padding(.horizontal, 32)
                .frame(maxWidth: buttonProps.fullWidth ? .infinity : nil)
                .frame(height: 60)
                .background(colors.backgroundColor)
                .foregroundColor(colors.textColor)
                .cornerRadius(CornerRadius.infinite.rawValue)
        )
    }
    
    public var body: some View {
        let colors = colorProvider.colorScheme(
            themeManager: themeManager,
            isDisabled: buttonProps.isDisabled!,
            variant: buttonProps.variant
        )
        
        Button(action: buttonProps.action) {
            renderContent()
            
        }
        .disabled(isButtonDisabled)
        .overlay(
            RoundedRectangle(cornerRadius: CornerRadius.infinite.rawValue)
                .stroke(colors.borderColor, lineWidth: 1.5)
        )
        .environmentObject(ThemeManager())
    }
}

#Preview {
    ScrollView {
        VStack {
            DSButton(buttonProps: DSButtonProps(
                title: "Primary",
                variant: .primary,
                action: { },
                isLoading: true
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Disabled and loading",
                variant: .primary,
                action: { },
                isDisabled: true,
                isLoading: true
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Disabled",
                variant: .primary,
                action: { },
                isDisabled: true
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Primary",
                variant: .primary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Secondary",
                variant: .secondary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Tertiary",
                variant: .tertiary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Destructive",
                variant: .destructive,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Outline Primary",
                variant: .outlinePrimary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Outline Secondary",
                variant: .outlineSecondary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Outline Tertiary",
                variant: .outlineTertiary,
                action: { }
            ))
            .padding(.bottom)
            
            DSButton(buttonProps: DSButtonProps(
                title: "Outline Destructive",
                variant: .outlineDestructive,
                action: { }
            ))
            .padding(.bottom)
        }
        .padding()
    }
    .frame(maxHeight: .infinity)
    
}
